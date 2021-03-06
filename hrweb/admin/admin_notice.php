﻿<?php
define('IN_HIGHWAY', true);
require_once(dirname(__FILE__).'/../data/config.php');
require_once(dirname(__FILE__).'/include/admin_common.inc.php');
require_once(ADMIN_ROOT_PATH.'include/admin_notice_fun.php');
$act = !empty($_GET['act']) ? trim($_GET['act']) : 'list';
$smarty->assign('act',$act);
$smarty->assign('pageheader',"お知らせ管理");
if($act == 'list')
{
	get_token();
	check_permissions($_SESSION['admin_purview'],"notice_show");
	require_once(HIGHWAY_ROOT_PATH.'include/page.class.php');
	$oederbysql=" order BY `sort` DESC,id DESC ";
	$key=isset($_GET['key'])?trim($_GET['key']):"";
	$key_type=isset($_GET['key_type'])?intval($_GET['key_type']):"";
	if ($key && $key_type>0)
	{
		
		if     ($key_type===1)$wheresql=" WHERE n.title like '%{$key}%'";
		$oederbysql="";
	}
	!empty($_GET['type_id'])? $wheresqlarr['n.type_id']=intval($_GET['type_id']):'';
	if (is_array($wheresqlarr)) $wheresql=wheresql($wheresqlarr);
	if (!empty($_GET['settr']))
	{
		$settr=strtotime("-".intval($_GET['settr'])." day");
		$wheresql=empty($wheresql)?" WHERE n.addtime> ".$settr:$wheresql." AND n.addtime> ".$settr;
	}
	
	$joinsql=" LEFT JOIN ".table('notice_category')." AS c ON n.type_id=c.id  ";
	$total_sql="SELECT COUNT(*) AS num FROM ".table('notice')." AS n".$joinsql.$wheresql;
	$page = new page(array('total'=>$db->get_total($total_sql),'perpage'=>$perpage));
	$currenpage=$page->nowindex;
	$offset=($currenpage-1)*$perpage;
	$notice = get_notice($offset, $perpage,$joinsql.$wheresql.$oederbysql);	
	$smarty->assign('category',get_notice_category());
	$smarty->assign('notice',$notice);
	$smarty->assign('page',$page->show(3));	
	$smarty->assign('navlabel',"list");
	$smarty->display('notice/admin_notice.htm');
}
elseif($act == 'edit')
{
	get_token();
	check_permissions($_SESSION['admin_purview'],"notice_edit");
	$smarty->assign('notice',get_notice_one($_GET['id']));//读取指定ID的说明页
	$smarty->assign('category',get_notice_category());//获取分类
	$smarty->display('notice/admin_notice_edit.htm');
}
elseif($act == 'editsave')
{
	check_token();
	check_permissions($_SESSION['admin_purview'],"notice_edit");
	$id = !empty($_POST['id']) ? intval($_POST['id']) : adminmsg('パラメータエラー',1);
	$setsqlarr['title']=trim($_POST['title'])?trim($_POST['title']):adminmsg('タイトルを入力してください！',1);
	$setsqlarr['type_id']=trim($_POST['type_id'])?intval($_POST['type_id']):0;
	$setsqlarr['content']=trim($_POST['content']);
	$setsqlarr['tit_color']=trim($_POST['tit_color']);
	$setsqlarr['tit_b']=intval($_POST['tit_b']);
	$setsqlarr['is_display']=intval($_POST['is_display']);
	$setsqlarr['is_url']=trim($_POST['is_url']);
	$setsqlarr['seo_keywords']=trim($_POST['seo_keywords']);
	$setsqlarr['seo_description']=trim($_POST['seo_description']);
	$setsqlarr['sort']=intval($_POST['sort']);
	$link[0]['text'] = "一覧に戻る";
	$link[0]['href'] = '?';
	$link[1]['text'] = "閲覧変更";
	$link[1]['href'] = "?act=edit&id=".$id;
	write_log("idを次に変更".$id."のお知らせ", $_SESSION['admin_name'],3);
 	!$db->updatetable(table('notice'),$setsqlarr," id=".$id."")?adminmsg("変更失敗！",0):adminmsg("変更成功！",2,$link);
}
elseif($act == 'add')
{
	get_token();
	check_permissions($_SESSION['admin_purview'],"notice_add");
	$smarty->assign('navlabel',"add");
	$smarty->assign('category',get_notice_category());
	$smarty->display('notice/admin_notice_add.htm');
}
elseif($act == 'addsave')
{
	check_token();
	check_permissions($_SESSION['admin_purview'],"notice_add");
	$setsqlarr['title']=trim($_POST['title'])?trim($_POST['title']):adminmsg('説明ページの名称を入力してください！',1);
	$setsqlarr['type_id']=trim($_POST['type_id'])?intval($_POST['type_id']):adminmsg('分類を選択してください！',1);
	$setsqlarr['content']=trim($_POST['content']);
	$setsqlarr['tit_color']=trim($_POST['tit_color']);
	$setsqlarr['tit_b']=intval($_POST['tit_b']);
	$setsqlarr['is_display']=intval($_POST['is_display']);
	$setsqlarr['is_url']=trim($_POST['is_url']);
	$setsqlarr['seo_keywords']=trim($_POST['seo_keywords']);
	$setsqlarr['seo_description']=trim($_POST['seo_description']);
	$setsqlarr['sort']=intval($_POST['sort']);
	$setsqlarr['addtime']=$timestamp;
	$link[0]['text'] = "続く追加";
	$link[0]['href'] = '?act=add&type_id='.$setsqlarr['type_id'];
	$link[1]['text'] = "一覧に戻る";
	$link[1]['href'] = '?';
	write_log("お知らせ追加：".$setsqlarr['title'], $_SESSION['admin_name'],3);
	$insertid = $db->inserttable(table('notice'),$setsqlarr,1);
	if(!$insertid){
		adminmsg("追加失敗！",0);
	}else{
		baidu_submiturl(url_rewrite('HW_noticeshow',array('id'=>$insertid)),'addnotice');
		adminmsg("追加成功！",2,$link);
	}
}
elseif($act == 'notice_del')
{
	check_token();
	check_permissions($_SESSION['admin_purview'],"notice_del");
	$id=$_REQUEST['id'];
	if ($num=del_notice($id))
	{
	write_log("お知らせ削除，削除件数".$num."行", $_SESSION['admin_name'],3);
	adminmsg("削除成功！削除件数".$num."行",2);
	}
	else
	{
	adminmsg("削除失敗！",0);
	}
}
elseif($act == 'category')
{
	get_token();
	check_permissions($_SESSION['admin_purview'],"notice_category");
	$smarty->assign('category',get_notice_category());
	$smarty->assign('navlabel',"category");
	$smarty->display('notice/admin_notice_category.htm');
}
elseif($act == 'category_add')
{
	get_token();
	check_permissions($_SESSION['admin_purview'],"notice_category");
	$smarty->assign('navlabel',"category");
	$smarty->display('notice/admin_notice_category_add.htm');
}
elseif($act == 'add_category_save')
{
	check_token();
	check_permissions($_SESSION['admin_purview'],"notice_category");
	$num=0;
	if (is_array($_POST['categoryname']) && count($_POST['categoryname'])>0)
	{
		for ($i =0; $i <count($_POST['categoryname']);$i++){
			if (!empty($_POST['categoryname'][$i]))
			{		
				$setsqlarr['categoryname']=trim($_POST['categoryname'][$i]);				
				!$db->inserttable(table('notice_category'),$setsqlarr)?adminmsg("追加失敗！",0):"";
				$num=$num+$db->affected_rows();
			}

		}

	}
	if ($num==0)
	{
	adminmsg("追加失敗,データ不完全",1);
	}
	else
	{
	$link[0]['text'] = "分類管理に戻る";
	$link[0]['href'] = '?act=category';
	$link[1]['text'] = "続く属性追加";
	$link[1]['href'] = "?act=category_add";
	write_log("追加成功！追加件数".$num."件お知らせ分類", $_SESSION['admin_name'],3);
	adminmsg("追加成功！追加件数".$num."件分類",2,$link);
	}
}
elseif($act == 'edit_category')
{
	get_token();
	check_permissions($_SESSION['admin_purview'],"notice_category");
	$id=intval($_GET['id']);
	$smarty->assign('category',get_notice_category_one($id));
	$smarty->assign('navlabel',"category");
	$smarty->display('notice/admin_notice_category_edit.htm');
}
elseif($act == 'edit_category_save')
{
	check_token();
	check_permissions($_SESSION['admin_purview'],"notice_category");
	$id=intval($_POST['id']);	
	$setsqlarr['categoryname']=trim($_POST['categoryname'])?trim($_POST['categoryname']):adminmsg('分類名称を入力してください！',1);
	$link[0]['text'] = "変更結果閲覧";
	$link[0]['href'] = '?act=edit_category&id='.$id;
	$link[1]['text'] = "分類管理に戻る";
	$link[1]['href'] = '?act=category';
	write_log("idを次に変更".$id."のお知らせ分類", $_SESSION['admin_name'],3);
	!$db->updatetable(table('notice_category'),$setsqlarr," id=".$id."")?adminmsg("変更失敗！",0):adminmsg("変更成功！",2,$link);
}
elseif($act == 'del_category')
{
	check_token();
	check_permissions($_SESSION['admin_purview'],"notice_category");
	$id=$_REQUEST['id'];
	if ($num=del_notice_category($id))
	{
	write_log("お知らせ分類削除！削除件数".$num."行", $_SESSION['admin_name'],3);
	adminmsg("削除成功！削除件数".$num."行",2);
	}
	else
	{
	adminmsg("削除失敗！",0);
	}
}
?>
