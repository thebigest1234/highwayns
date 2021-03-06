USE [HPS]
GO
/****** Object:  Table [dbo].[职历]    Script Date: 06/06/2014 10:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[职历](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Country] [nvarchar](50) NULL,
	[Content] [nvarchar](1000) NULL,
	[Tool] [nvarchar](50) NULL,
	[Role] [varchar](10) NULL,
	[Range] [varchar](11) NULL,
	[Company] [nvarchar](50) NULL,
	[PriceType] [nvarchar](18) NULL,
	[Price] [numeric](18, 2) NULL,
	[UserId] [varchar](20) NULL,
 CONSTRAINT [PK_职历] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[学历]    Script Date: 06/06/2014 10:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[学历](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[School] [nvarchar](50) NULL,
	[Special] [nvarchar](100) NULL,
	[Graduation] [nvarchar](50) NULL,
	[UserId] [varchar](20) NULL,
 CONSTRAINT [PK_学历] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[资格]    Script Date: 06/06/2014 10:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[资格](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Insitute] [nvarchar](50) NULL,
	[Special] [nvarchar](1000) NULL,
	[Status] [nvarchar](50) NULL,
	[UserId] [varchar](20) NULL,
 CONSTRAINT [PK_资格] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[派遣]    Script Date: 06/06/2014 10:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[派遣](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Country] [nvarchar](50) NULL,
	[Content] [nvarchar](1000) NULL,
	[Tool] [nvarchar](50) NULL,
	[Role] [varchar](10) NULL,
	[Range] [varchar](11) NULL,
	[Company] [nvarchar](50) NULL,
	[Sender] [nvarchar](50) NULL,
	[Customer] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Tel] [nvarchar](50) NULL,
	[PriceType] [nvarchar](18) NULL,
	[Price] [numeric](18, 2) NULL,
	[UpTime] [numeric](18, 2) NULL,
	[UpPrice] [numeric](18, 2) NULL,
	[DownTime] [numeric](18, 2) NULL,
	[DownPrice] [numeric](18, 2) NULL,
	[PaymentDay] [varchar](18) NULL,
	[UserId] [varchar](20) NULL,
 CONSTRAINT [PK_派遣] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[雇员]    Script Date: 06/06/2014 10:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[雇员](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[NameKana] [nvarchar](50) NULL,
	[NamePinyin] [nvarchar](50) NULL,
	[Sex] [nvarchar](1) NULL,
	[Marriaged] [nvarchar](1) NULL,
	[Birthday] [datetime] NULL,
	[BirthAddress] [nvarchar](100) NULL,
	[LocalAddress] [nvarchar](200) NULL,
	[CurrentAddress] [nvarchar](200) NULL,
	[Occupation] [nvarchar](20) NULL,
	[TEL] [nvarchar](20) NULL,
	[PassportNo] [nvarchar](20) NULL,
	[ExpireDate] [datetime] NULL,
	[BizaNo] [nvarchar](20) NULL,
	[BizaType] [nvarchar](20) NULL,
	[BizaRange] [nvarchar](20) NULL,
	[BizaExpireDate] [datetime] NULL,
	[ExpBizaType] [nvarchar](20) NULL,
	[ExpBizaRange] [nvarchar](20) NULL,
	[ExpReason] [nvarchar](200) NULL,
	[EnterDay] [datetime] NULL,
	[NearStation] [nvarchar](10) NULL,
	[Skill] [nvarchar](60) NULL,
	[Skill1] [nvarchar](100) NULL,
	[Skill2] [nvarchar](100) NULL,
	[Skill3] [nvarchar](100) NULL,
	[SkillManager] [nvarchar](100) NULL,
	[SkillRange] [nvarchar](11) NULL,
	[SkillJapanese] [nvarchar](4) NULL,
	[SkillEnglish] [nvarchar](4) NULL,
	[Comment1] [nvarchar](100) NULL,
	[Comment2] [nvarchar](100) NULL,
	[SelfComment1] [nvarchar](200) NULL,
	[SelfComment2] [nvarchar](200) NULL,
	[SelfComment3] [nvarchar](200) NULL,
	[UserId] [varchar](20) NULL,
 CONSTRAINT [PK_雇员] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_职历]    Script Date: 06/06/2014 10:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_职历]
AS
SELECT                  a.id, a.EmpId, a.StartDate, a.EndDate, a.Country, a.[Content], a.Tool, a.Role,a.Range,a.Company,a.PriceType,a.Price, a.UserId
FROM                     dbo.职历 AS a INNER JOIN
                                      (SELECT                  MAX(id) AS id, EmpId
                                            FROM                     dbo.职历
                                            GROUP BY          EmpId) AS b ON a.id = b.id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[33] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 233
               Bottom = 96
               Right = 390
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_职历'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_职历'
GO
/****** Object:  View [dbo].[VW_学历]    Script Date: 06/06/2014 10:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_学历]
AS
SELECT                  a.id, a.EmpId, a.StartDate, a.EndDate, a.School, a.Special, a.Graduation, a.UserId
FROM                     dbo.学历 AS a INNER JOIN
                                      (SELECT                  MAX(id) AS id, EmpId
                                            FROM                     dbo.学历
                                            GROUP BY          EmpId) AS b ON a.id = b.id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[33] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 233
               Bottom = 96
               Right = 390
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_学历'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_学历'
GO
/****** Object:  View [dbo].[VW_资格]    Script Date: 06/06/2014 10:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_资格]
AS
SELECT                  a.id, a.EmpId, a.StartDate, a.EndDate, a.Insitute, a.Special, a.[Status], a.UserId
FROM                     dbo.资格 AS a INNER JOIN
                                      (SELECT                  MAX(id) AS id, EmpId
                                            FROM                     dbo.资格
                                            GROUP BY          EmpId) AS b ON a.id = b.id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[33] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 233
               Bottom = 96
               Right = 390
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_资格'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_资格'
GO
/****** Object:  View [dbo].[VW_派遣]    Script Date: 06/06/2014 10:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_派遣]
AS
SELECT                  a.id, a.EmpId, a.StartDate, a.EndDate, a.Country, a.[Content], a.Tool, a.[Role],a.[Range],a.Company, a.Sender,a.Customer,a.[Address],a.Tel,
a.PriceType,a.Price,a.UpTime,a.UpPrice,a.DownTime,a.DownPrice,a.PaymentDay, a.UserId
FROM                     dbo.派遣 AS a INNER JOIN
                                      (SELECT                  MAX(id) AS id, EmpId
                                            FROM                     dbo.派遣
                                            GROUP BY          EmpId) AS b ON a.id = b.id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 233
               Bottom = 96
               Right = 390
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_派遣'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_派遣'
GO
/****** Object:  View [dbo].[VW_雇员]    Script Date: 06/06/2014 10:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_雇员]
AS
SELECT                  dbo.雇员.*, 
                                  dbo.VW_职历.StartDate AS workStartDate, 
				  dbo.VW_职历.EndDate AS workEndDate, 
				  dbo.VW_职历.Country AS workaddres, 
				  dbo.VW_职历.[Content] AS workContent, 
				  dbo.VW_职历.Tool AS workTool,
                                  dbo.VW_职历.[Role] AS workRole, 
                                  dbo.VW_职历.[Range] AS workRange, 
                                  dbo.VW_职历.[Company] AS workCompany, 
                                  dbo.VW_职历.[PriceType] AS workPriceType, 
                                  dbo.VW_职历.[Price] AS workPrice, 
				  dbo.VW_派遣.StartDate AS sendStartDate, 
			          dbo.VW_派遣.EndDate AS sendEndDate, 
				  dbo.VW_派遣.Country AS sendCountry, 
                                  dbo.VW_派遣.[Content] AS sendContent, 
				  dbo.VW_派遣.Tool AS sendTool, 
				  dbo.VW_派遣.[Role] AS sendRole, 
				  dbo.VW_派遣.[Range] AS sendRange, 
				  dbo.VW_派遣.Company AS sendCompany, 
				  dbo.VW_派遣.Sender AS sendSender, 
				  dbo.VW_派遣.Customer AS sendCustomer,
				  dbo.VW_派遣.[Address] AS sendAddress, 
				  dbo.VW_派遣.Tel AS sendTel,
				  dbo.VW_派遣.PriceType AS sendPriceType,
				  dbo.VW_派遣.Price AS sendPrice,
				  dbo.VW_派遣.UpTime AS sendUpTime,
				  dbo.VW_派遣.UpPrice AS sendUpPrice,
				  dbo.VW_派遣.DownTime AS sendDownTime,
				  dbo.VW_派遣.DownPrice AS sendDownPrice,
				  dbo.VW_派遣.PaymentDay AS sendPaymentDay,								   
                                  dbo.VW_学历.StartDate AS schoolStartDate, 
				  dbo.VW_学历.EndDate AS schoolEndDate, 
				  dbo.VW_学历.School AS schoolSchool, 
				  dbo.VW_学历.[Special] AS schoolSpecial, 
                                  dbo.VW_学历.Graduation AS schoolGraduation, 
                                  dbo.VW_资格.StartDate AS trainStartDate, 
				  dbo.VW_资格.EndDate AS trainEndDate, 
				  dbo.VW_资格.Insitute AS trainInsitute, 
				  dbo.VW_资格.[Special] AS trainSpecial, 
                                  dbo.VW_资格.[Status] AS trainStatus 
FROM                     dbo.雇员 LEFT OUTER JOIN
                                  dbo.VW_职历 ON dbo.VW_职历.EmpId = dbo.雇员.EmpId LEFT OUTER JOIN
                                  dbo.VW_派遣 ON dbo.雇员.EmpId = dbo.VW_派遣.EmpId LEFT OUTER JOIN
                                  dbo.VW_学历 ON dbo.VW_学历.EmpId = dbo.雇员.EmpId LEFT OUTER JOIN
                                  dbo.VW_资格 ON dbo.VW_资格.EmpId = dbo.雇员.EmpId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[66] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "雇员"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VW_职历"
            Begin Extent = 
               Top = 94
               Left = 256
               Bottom = 266
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VW_派遣"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 126
               Right = 599
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VW_学历"
            Begin Extent = 
               Top = 137
               Left = 442
               Bottom = 257
               Right = 599
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 24
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_雇员'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'egin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_雇员'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_雇员'
GO
