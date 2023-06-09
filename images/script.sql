USE [Loyalty]
GO
/****** Object:  Table [dbo].[tbl_UnderMasterCardHolder]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UnderMasterCardHolder](
	[MasterId] [int] NOT NULL,
	[CardNo] [nvarchar](255) NULL,
	[GroupName] [nvarchar](255) NULL,
	[UnderMasterHolder_CardNo] [nvarchar](255) NULL,
	[UnderThisCompany] [int] NULL,
	[DateOfCreation] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SpecialEvent]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SpecialEvent](
	[SpecialEventId] [int] NOT NULL,
	[SpecialEventName] [nvarchar](255) NULL,
	[DateofSave] [datetime] NULL,
	[DateofMod] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_SpecialEvent] ([SpecialEventId], [SpecialEventName], [DateofSave], [DateofMod]) VALUES (1, N'Birthday', CAST(0x0000A09500000000 AS DateTime), CAST(0x0000A09500000000 AS DateTime))
INSERT [dbo].[tbl_SpecialEvent] ([SpecialEventId], [SpecialEventName], [DateofSave], [DateofMod]) VALUES (3, N'Anniversary', CAST(0x0000A09500000000 AS DateTime), CAST(0x0000A09500000000 AS DateTime))
INSERT [dbo].[tbl_SpecialEvent] ([SpecialEventId], [SpecialEventName], [DateofSave], [DateofMod]) VALUES (4, N'Wedding', CAST(0x0000A0AD00000000 AS DateTime), NULL)
INSERT [dbo].[tbl_SpecialEvent] ([SpecialEventId], [SpecialEventName], [DateofSave], [DateofMod]) VALUES (5, N'Get together', CAST(0x0000A0AE00000000 AS DateTime), NULL)
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](255) NULL,
	[actionId] [int] NULL,
	[UnderRole] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (28, NULL, 26, 6)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (29, NULL, 27, 6)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (30, NULL, 28, 6)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (31, NULL, 26, 12)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (32, NULL, 27, 12)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (33, NULL, 28, 12)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (6, N'Cashier', 7, 0)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (7, NULL, 24, 6)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (8, NULL, 3, 6)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (9, NULL, 2, 6)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (10, NULL, 1, 6)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (11, NULL, 25, 6)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (12, N'Admin', 7, 0)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (13, NULL, 24, 12)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (14, NULL, 3, 12)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (15, NULL, 2, 12)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (16, NULL, 1, 12)
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [actionId], [UnderRole]) VALUES (17, NULL, 25, 12)
/****** Object:  Table [dbo].[tbl_Raise]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Raise](
	[ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PaymentType]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PaymentType](
	[PaymentTypeID] [int] NOT NULL,
	[Name_Pay] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_PaymentType] ([PaymentTypeID], [Name_Pay], [Code]) VALUES (1, N'Cash', N'CASH')
INSERT [dbo].[tbl_PaymentType] ([PaymentTypeID], [Name_Pay], [Code]) VALUES (2, N'Card', N'CRD')
/****** Object:  Table [dbo].[tbl_Payment]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Payment](
	[PaymentId] [int] NOT NULL,
	[CardNo] [nvarchar](255) NULL,
	[Amount] [int] NULL,
	[PaymentTypeID] [int] NULL,
	[ConnectedID] [int] NULL,
	[CheckDataID] [int] NULL,
	[Tracked] [bit] NOT NULL,
	[S] [int] NULL,
	[DateofSave] [datetime] NULL,
	[DateofMod] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Payment] ([PaymentId], [CardNo], [Amount], [PaymentTypeID], [ConnectedID], [CheckDataID], [Tracked], [S], [DateofSave], [DateofMod]) VALUES (299, N'M542 8987 5311', 0, 1, NULL, NULL, 0, NULL, CAST(0x0000A0DF00BEF974 AS DateTime), NULL)
INSERT [dbo].[tbl_Payment] ([PaymentId], [CardNo], [Amount], [PaymentTypeID], [ConnectedID], [CheckDataID], [Tracked], [S], [DateofSave], [DateofMod]) VALUES (300, N'M541 320A CE3D', 0, 1, NULL, NULL, 0, NULL, CAST(0x0000A0DF00BFFFF4 AS DateTime), NULL)
INSERT [dbo].[tbl_Payment] ([PaymentId], [CardNo], [Amount], [PaymentTypeID], [ConnectedID], [CheckDataID], [Tracked], [S], [DateofSave], [DateofMod]) VALUES (301, N'M541 3225 CC50', 0, 1, NULL, NULL, 0, NULL, CAST(0x0000A15200908544 AS DateTime), NULL)
/****** Object:  Table [dbo].[Tbl_Note]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Note](
	[ID] [int] NOT NULL,
	[NoteName] [nvarchar](255) NULL,
	[NoteType] [int] NULL,
	[NoteNote] [nvarchar](255) NULL,
	[NoteDate] [datetime] NULL,
	[CardNo] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MailSettings]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MailSettings](
	[SettingId] [int] NOT NULL,
	[FromEmailID] [nvarchar](255) NULL,
	[MailPassword] [nvarchar](255) NULL,
	[SmtpHostServer] [nvarchar](255) NULL,
	[SmtpPort] [int] NULL,
	[Dateofsave] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_MailSettings] ([SettingId], [FromEmailID], [MailPassword], [SmtpHostServer], [SmtpPort], [Dateofsave]) VALUES (1, N'yourmail@gmail.com', N'uuuuu', N'smtp.gmail.com', 25, CAST(0x0000A0D700536D6C AS DateTime))
/****** Object:  Table [dbo].[tbl_LoyaltyOfferList]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LoyaltyOfferList](
	[LoyaltyOfferId] [int] NOT NULL,
	[LoyaltyName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_LoyaltyOfferList] ([LoyaltyOfferId], [LoyaltyName]) VALUES (3, N'Gift')
INSERT [dbo].[tbl_LoyaltyOfferList] ([LoyaltyOfferId], [LoyaltyName]) VALUES (4, N'Loyalty')
INSERT [dbo].[tbl_LoyaltyOfferList] ([LoyaltyOfferId], [LoyaltyName]) VALUES (5, N'Gift and Loyalty')
/****** Object:  Table [dbo].[tbl_ItemList]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ItemList](
	[ItemListId] [int] NOT NULL,
	[ItemName] [nvarchar](255) NULL,
	[Amount] [int] NULL,
	[Point] [int] NULL,
	[DeatOfCreation] [datetime] NULL,
	[DateOfModification] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Group_CustomerType]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Group_CustomerType](
	[GroupId] [int] NOT NULL,
	[TypeName] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Group_CustomerType] ([GroupId], [TypeName], [Remarks]) VALUES (1, N'Individual', NULL)
INSERT [dbo].[tbl_Group_CustomerType] ([GroupId], [TypeName], [Remarks]) VALUES (2, N'Group', NULL)
INSERT [dbo].[tbl_Group_CustomerType] ([GroupId], [TypeName], [Remarks]) VALUES (4, N'Company', NULL)
/****** Object:  Table [dbo].[tbl_FixedValue]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FixedValue](
	[FixedVlaueId] [int] NOT NULL,
	[FixedValue] [int] NULL,
	[Points] [int] NULL,
	[DateOfCreation] [datetime] NULL,
	[DateOfModification] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_FixedValue] ([FixedVlaueId], [FixedValue], [Points], [DateOfCreation], [DateOfModification]) VALUES (1, 25, 250, CAST(0x0000A06E00000000 AS DateTime), NULL)
INSERT [dbo].[tbl_FixedValue] ([FixedVlaueId], [FixedValue], [Points], [DateOfCreation], [DateOfModification]) VALUES (2, 50, 500, CAST(0x0000A06E00000000 AS DateTime), CAST(0x0000A06E00000000 AS DateTime))
INSERT [dbo].[tbl_FixedValue] ([FixedVlaueId], [FixedValue], [Points], [DateOfCreation], [DateOfModification]) VALUES (3, 75, 750, CAST(0x0000A06E00000000 AS DateTime), NULL)
INSERT [dbo].[tbl_FixedValue] ([FixedVlaueId], [FixedValue], [Points], [DateOfCreation], [DateOfModification]) VALUES (4, 100, 1000, CAST(0x0000A06E00000000 AS DateTime), NULL)
INSERT [dbo].[tbl_FixedValue] ([FixedVlaueId], [FixedValue], [Points], [DateOfCreation], [DateOfModification]) VALUES (5, 1, 10, CAST(0x0000A09400000000 AS DateTime), NULL)
INSERT [dbo].[tbl_FixedValue] ([FixedVlaueId], [FixedValue], [Points], [DateOfCreation], [DateOfModification]) VALUES (7, 10, 1000, CAST(0x0000A0A900000000 AS DateTime), CAST(0x0000A0A900000000 AS DateTime))
/****** Object:  Table [dbo].[tbl_FixedUnit]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FixedUnit](
	[UnitId] [int] NOT NULL,
	[SessionDividedBy] [int] NULL,
	[DateofCreation] [datetime] NULL,
	[DateOfModification] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_FixedUnit] ([UnitId], [SessionDividedBy], [DateofCreation], [DateOfModification]) VALUES (13, 10, CAST(0x0000A0AD00000000 AS DateTime), NULL)
/****** Object:  Table [dbo].[tbl_FixedPoints]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FixedPoints](
	[FixedPointId] [int] NOT NULL,
	[MultiplybyPoint] [int] NULL,
	[DateOfCreation] [datetime] NULL,
	[DateOfModification] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_FixedPoints] ([FixedPointId], [MultiplybyPoint], [DateOfCreation], [DateOfModification]) VALUES (1, 10, CAST(0x0000A0AA00000000 AS DateTime), CAST(0x0000A0AC00000000 AS DateTime))
/****** Object:  Table [dbo].[tbl_Deactivte_Reissue]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Deactivte_Reissue](
	[ReIssueId] [int] NOT NULL,
	[DeactivatedCardNo] [nvarchar](255) NULL,
	[ReIssuedCardNo] [nvarchar](255) NULL,
	[DateOfCreation] [datetime] NULL,
	[DateOfModification] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_date]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_date](
	[ID] [int] NOT NULL,
	[DateOfCreation] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CustomerImage]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CustomerImage](
	[ImageId] [int] NOT NULL,
	[CustomerCardID] [nvarchar](255) NULL,
	[pic] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CustomerDetails]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CustomerDetails](
	[CustomerID] [int] NOT NULL,
	[CardNo] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[BirthDate] [datetime] NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[ExpDate] [datetime] NULL,
	[CustomerManualID] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[MobileNo] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SubcToSMSList] [bit] NOT NULL,
	[SubcToEmailList] [bit] NOT NULL,
	[SubscribeToSpecialOffer] [bit] NOT NULL,
	[CardRecivedDate] [datetime] NULL,
	[GroupId] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_CustomerDetails] ([CustomerID], [CardNo], [Title], [FirstName], [LastName], [BirthDate], [Address1], [Address2], [City], [State], [Zip], [ExpDate], [CustomerManualID], [Phone], [MobileNo], [Email], [SubcToSMSList], [SubcToEmailList], [SubscribeToSpecialOffer], [CardRecivedDate], [GroupId]) VALUES (312, N'M542 8987 5311', N'Mr.', N'res', N'', NULL, N'', N'', N'', N'', N'', NULL, N'ECBB1609', N'', N'', N'', 0, 0, 0, CAST(0x0000A0DF00BEE330 AS DateTime), NULL)
INSERT [dbo].[tbl_CustomerDetails] ([CustomerID], [CardNo], [Title], [FirstName], [LastName], [BirthDate], [Address1], [Address2], [City], [State], [Zip], [ExpDate], [CustomerManualID], [Phone], [MobileNo], [Email], [SubcToSMSList], [SubcToEmailList], [SubscribeToSpecialOffer], [CardRecivedDate], [GroupId]) VALUES (313, N'M541 320A CE3D', N'Mr.', N'd', N'', NULL, N'', N'', N'', N'', N'', NULL, N'BE3FF9EF', N'', N'', N'', 0, 0, 0, CAST(0x0000A0DF00BFFC70 AS DateTime), NULL)
INSERT [dbo].[tbl_CustomerDetails] ([CustomerID], [CardNo], [Title], [FirstName], [LastName], [BirthDate], [Address1], [Address2], [City], [State], [Zip], [ExpDate], [CustomerManualID], [Phone], [MobileNo], [Email], [SubcToSMSList], [SubcToEmailList], [SubscribeToSpecialOffer], [CardRecivedDate], [GroupId]) VALUES (314, N'M541 3225 CC50', N'Mr.', N'raj', N'', NULL, N'', N'', N'', N'', N'', NULL, N'CF8E403A', N'', N'', N'', 0, 0, 0, CAST(0x0000A15200907860 AS DateTime), NULL)
/****** Object:  Table [dbo].[Tbl_CompanyCardRequirment]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CompanyCardRequirment](
	[ID] [int] NOT NULL,
	[CompanyName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[EmailId] [nvarchar](255) NULL,
	[ContactPerson] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Province] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[DateofSave] [datetime] NULL,
	[DateOfModification] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Company]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Company](
	[CompanyId] [int] NOT NULL,
	[CardNo] [nvarchar](255) NULL,
	[Categorie] [nvarchar](255) NULL,
	[CompanyName] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CardTypes]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CardTypes](
	[CartTypeID] [int] NOT NULL,
	[CardName] [nvarchar](255) NULL,
	[CardDescription] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[IsLoyalty] [bit] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_CardTypes] ([CartTypeID], [CardName], [CardDescription], [Code], [IsLoyalty]) VALUES (3, N'Gift', N'Its an offer for cash', N'G', 0)
INSERT [dbo].[tbl_CardTypes] ([CartTypeID], [CardName], [CardDescription], [Code], [IsLoyalty]) VALUES (4, N'Loyalty', N'Its an offer for points', N'L', 1)
INSERT [dbo].[tbl_CardTypes] ([CartTypeID], [CardName], [CardDescription], [Code], [IsLoyalty]) VALUES (5, N'Gift and Loyalty', N'Its an offer for both cash and points', N'GL', 0)
INSERT [dbo].[tbl_CardTypes] ([CartTypeID], [CardName], [CardDescription], [Code], [IsLoyalty]) VALUES (6, N'Custom', N'Its an offer where amount has been fixed and offered for units', N'C', 0)
INSERT [dbo].[tbl_CardTypes] ([CartTypeID], [CardName], [CardDescription], [Code], [IsLoyalty]) VALUES (7, N'Points Card', N'Its an offer for points', N'PC', 0)
/****** Object:  Table [dbo].[tbl_CardPoints]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CardPoints](
	[CardAmtID] [int] NOT NULL,
	[CardNo] [nvarchar](255) NULL,
	[Amount] [float] NULL,
	[PaymentTypeId] [int] NULL,
	[UserId] [int] NULL,
	[Note] [nvarchar](255) NULL,
	[ActionId] [int] NULL,
	[TotalSession] [int] NULL,
	[Points] [int] NULL,
	[PointsFromToCard] [nvarchar](255) NULL,
	[PointsFromToCardDate] [datetime] NULL,
	[Tip] [nvarchar](255) NULL,
	[ConnectedId] [int] NULL,
	[ReceDate] [datetime] NULL,
	[ItemId] [int] NULL,
	[IsVisit] [bit] NOT NULL,
	[DepartmentID] [int] NULL,
	[DateofSave] [datetime] NULL,
	[DateofModified] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_CardPoints] ([CardAmtID], [CardNo], [Amount], [PaymentTypeId], [UserId], [Note], [ActionId], [TotalSession], [Points], [PointsFromToCard], [PointsFromToCardDate], [Tip], [ConnectedId], [ReceDate], [ItemId], [IsVisit], [DepartmentID], [DateofSave], [DateofModified]) VALUES (1109, N'M542 8987 5311', 0, 1, 2, NULL, 7, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, CAST(0x0000A0DF00BEF974 AS DateTime), NULL)
INSERT [dbo].[tbl_CardPoints] ([CardAmtID], [CardNo], [Amount], [PaymentTypeId], [UserId], [Note], [ActionId], [TotalSession], [Points], [PointsFromToCard], [PointsFromToCardDate], [Tip], [ConnectedId], [ReceDate], [ItemId], [IsVisit], [DepartmentID], [DateofSave], [DateofModified]) VALUES (1110, N'M541 320A CE3D', 0, 1, 2, NULL, 7, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, CAST(0x0000A0DF00BFFFF4 AS DateTime), NULL)
INSERT [dbo].[tbl_CardPoints] ([CardAmtID], [CardNo], [Amount], [PaymentTypeId], [UserId], [Note], [ActionId], [TotalSession], [Points], [PointsFromToCard], [PointsFromToCardDate], [Tip], [ConnectedId], [ReceDate], [ItemId], [IsVisit], [DepartmentID], [DateofSave], [DateofModified]) VALUES (1111, N'M541 320A CE3D', 50, NULL, 2, NULL, 27, 5, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, CAST(0x0000A14001115124 AS DateTime), NULL)
INSERT [dbo].[tbl_CardPoints] ([CardAmtID], [CardNo], [Amount], [PaymentTypeId], [UserId], [Note], [ActionId], [TotalSession], [Points], [PointsFromToCard], [PointsFromToCardDate], [Tip], [ConnectedId], [ReceDate], [ItemId], [IsVisit], [DepartmentID], [DateofSave], [DateofModified]) VALUES (1112, N'M541 320A CE3D', 50, NULL, 2, NULL, 28, 2, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, CAST(0x0000A140011169C0 AS DateTime), NULL)
INSERT [dbo].[tbl_CardPoints] ([CardAmtID], [CardNo], [Amount], [PaymentTypeId], [UserId], [Note], [ActionId], [TotalSession], [Points], [PointsFromToCard], [PointsFromToCardDate], [Tip], [ConnectedId], [ReceDate], [ItemId], [IsVisit], [DepartmentID], [DateofSave], [DateofModified]) VALUES (1113, N'M541 3225 CC50', 0, 1, 4, NULL, 7, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, CAST(0x0000A15200908544 AS DateTime), NULL)
/****** Object:  Table [dbo].[Tbl_CardDetails]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CardDetails](
	[CardNo] [nvarchar](255) NULL,
	[CardTypeId] [int] NULL,
	[BarCodeFileName] [nvarchar](255) NULL,
	[PersonId] [int] NULL,
	[Credit] [int] NULL,
	[CreditPrice] [int] NULL,
	[CreditLimit] [int] NULL,
	[Type] [int] NULL,
	[Status] [bit] NOT NULL,
	[PinNo] [nvarchar](255) NULL,
	[CompanyId] [int] NULL,
	[ExpireDate] [datetime] NULL,
	[RecievedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CutomerNo] [nvarchar](255) NULL,
	[ActionDate] [datetime] NULL,
	[Deactivation] [datetime] NULL,
	[GroupId] [int] NULL,
	[AddPointsWithGroup] [bit] NOT NULL,
	[AddedWithGroup] [bit] NOT NULL,
	[DeactivateFlag] [bit] NOT NULL,
	[UnderCompany] [bit] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M542 8987 5311', 5, N'634848608941603105', NULL, NULL, NULL, NULL, NULL, 1, N'ECBB1609', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A0DF00BEF974 AS DateTime), NULL, 2, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M541 320A CE3D', 6, N'634848611341930396', NULL, NULL, NULL, NULL, NULL, 1, N'BE3FF9EF', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A0DF00BFFFF4 AS DateTime), NULL, 1, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M541 3225 CC50', 6, N'634848611341930396', NULL, NULL, NULL, NULL, NULL, 1, N'CF8E403A', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A15200908418 AS DateTime), NULL, 1, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 12B3 9E14', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'401DC5C9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 1CA8 13AD', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'CA452A47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 181F 9F66', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'B0847B6A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 1192 9E4B', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'82012A45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 1E52 0337', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'462FE3E2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 1DC0 37A2', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'899E9617', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 1245 CD2D', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'9C8D18AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 1BC2 4AA8', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'F22773FF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 1212 204A', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'75659CA1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 1DE6 AE27', NULL, N'634947851377676561', NULL, NULL, NULL, NULL, NULL, 0, N'F4C89220', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2960 A25E', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'3D1D02CE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2BEC 06C7', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'7B10E719', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2D88 0541', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'085026FA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2DC1 5B96', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'A5C1F084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 24FD 3509', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'EB39F59A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2692 C00B', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'758E0C0B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2CD5 9C63', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'456DAA28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 220F A64B', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'2C723A00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2780 05C9', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'52F40F42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2B84 80B0', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'87AA722F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2CA8 4FA9', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'1E6875AB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2DA7 38E0', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'DBAC996D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 218A F603', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'BDF64259', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2FD7 2D17', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'CF7BBB05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2BC5 EA4B', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'95485503', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2ED6 C2FB', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'89A9EF76', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2979 9512', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'806E5A57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 26BB 7ED1', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'0458D4F2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2777 9023', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'55B43A9A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
INSERT [dbo].[Tbl_CardDetails] ([CardNo], [CardTypeId], [BarCodeFileName], [PersonId], [Credit], [CreditPrice], [CreditLimit], [Type], [Status], [PinNo], [CompanyId], [ExpireDate], [RecievedDate], [ModifiedDate], [CutomerNo], [ActionDate], [Deactivation], [GroupId], [AddPointsWithGroup], [AddedWithGroup], [DeactivateFlag], [UnderCompany]) VALUES (N'M540 2984 25E3', NULL, N'634948104898193140', NULL, NULL, NULL, NULL, NULL, 0, N'C5BCFFDF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0)
/****** Object:  Table [dbo].[tbl_BarcodeFileDetails]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BarcodeFileDetails](
	[BarcodeFileID] [int] NOT NULL,
	[BarcodeFileName] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_BarcodeFileDetails] ([BarcodeFileID], [BarcodeFileName], [Remarks]) VALUES (64, N'634848608941603105', NULL)
INSERT [dbo].[tbl_BarcodeFileDetails] ([BarcodeFileID], [BarcodeFileName], [Remarks]) VALUES (65, N'634848611341930396', NULL)
INSERT [dbo].[tbl_BarcodeFileDetails] ([BarcodeFileID], [BarcodeFileName], [Remarks]) VALUES (66, N'634947851377676561', NULL)
INSERT [dbo].[tbl_BarcodeFileDetails] ([BarcodeFileID], [BarcodeFileName], [Remarks]) VALUES (67, N'634948104898193140', NULL)
/****** Object:  Table [dbo].[tbl_Barcode_CompanyBase]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Barcode_CompanyBase](
	[CompanyId] [int] NOT NULL,
	[Barcode] [nvarchar](255) NULL,
	[CompanyName] [nvarchar](255) NULL,
	[Prefix] [nvarchar](255) NULL,
	[UniqueNumber] [int] NULL,
	[DateofCreation] [datetime] NULL,
	[DateofModification] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AdminWords]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AdminWords](
	[AdminWordID] [int] NOT NULL,
	[AdminWords] [nvarchar](255) NULL,
	[DateOfCreation] [datetime] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ActivationAndDeactivation]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ActivationAndDeactivation](
	[ActDeActID] [int] NOT NULL,
	[CardNo] [nvarchar](255) NULL,
	[ActivationDate] [datetime] NULL,
	[ActionID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Action]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Action](
	[ActionId] [int] NOT NULL,
	[Name_action] [nvarchar](255) NULL,
	[ActionDescription] [nvarchar](255) NULL,
	[ReceiptPrint] [int] NULL,
	[DateofSave] [datetime] NULL,
	[DateofMod] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Action] ([ActionId], [Name_action], [ActionDescription], [ReceiptPrint], [DateofSave], [DateofMod]) VALUES (1, N'Redeem Cash', N'The process which used to deduct the amount details', NULL, NULL, NULL)
INSERT [dbo].[tbl_Action] ([ActionId], [Name_action], [ActionDescription], [ReceiptPrint], [DateofSave], [DateofMod]) VALUES (2, N'Loyalty Sale', N'The process which used to earn point while spending amount', NULL, NULL, NULL)
INSERT [dbo].[tbl_Action] ([ActionId], [Name_action], [ActionDescription], [ReceiptPrint], [DateofSave], [DateofMod]) VALUES (3, N'Credit Cash', N'The process which used to credit the amount details', NULL, NULL, NULL)
INSERT [dbo].[tbl_Action] ([ActionId], [Name_action], [ActionDescription], [ReceiptPrint], [DateofSave], [DateofMod]) VALUES (7, N'Activate Card', N'The process which used to activate the new card (Activation process)', NULL, NULL, NULL)
INSERT [dbo].[tbl_Action] ([ActionId], [Name_action], [ActionDescription], [ReceiptPrint], [DateofSave], [DateofMod]) VALUES (24, N'Add Points', N'The process which used to earn points', NULL, NULL, NULL)
INSERT [dbo].[tbl_Action] ([ActionId], [Name_action], [ActionDescription], [ReceiptPrint], [DateofSave], [DateofMod]) VALUES (25, N'Redeem Points', N'The process which used to deduct points according with redeem amount', NULL, NULL, NULL)
INSERT [dbo].[tbl_Action] ([ActionId], [Name_action], [ActionDescription], [ReceiptPrint], [DateofSave], [DateofMod]) VALUES (26, N'Deactivate Card', N'The Process which used to deactiavte the card (Deactivation Process)', NULL, NULL, NULL)
INSERT [dbo].[tbl_Action] ([ActionId], [Name_action], [ActionDescription], [ReceiptPrint], [DateofSave], [DateofMod]) VALUES (27, N'Add Session', N'The Process which used to add session according with the card transactions', NULL, NULL, NULL)
INSERT [dbo].[tbl_Action] ([ActionId], [Name_action], [ActionDescription], [ReceiptPrint], [DateofSave], [DateofMod]) VALUES (28, N'Redeem Session', N'The Process which used to deduct session according with the card transactions', NULL, NULL, NULL)
/****** Object:  Table [dbo].[FileTable]    Script Date: 04/29/2014 16:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileTable](
	[imageid] [int] NOT NULL,
	[CustomerId] [nvarchar](255) NULL,
	[File] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[FileTable] ([imageid], [CustomerId], [File]) VALUES (9, N'erere', 0x530079007300740065006D002E0042007900740065005B005D00)
INSERT [dbo].[FileTable] ([imageid], [CustomerId], [File]) VALUES (10, N'tm', 0x530079007300740065006D002E0042007900740065005B005D00)
INSERT [dbo].[FileTable] ([imageid], [CustomerId], [File]) VALUES (11, N'nissan', 0x530079007300740065006D002E0042007900740065005B005D00)
INSERT [dbo].[FileTable] ([imageid], [CustomerId], [File]) VALUES (12, N'Dir', 0x530079007300740065006D002E0042007900740065005B005D00)
INSERT [dbo].[FileTable] ([imageid], [CustomerId], [File]) VALUES (13, N'tttttttttttt', 0x530079007300740065006D002E00440072006100770069006E0067002E004200690074006D0061007000)
INSERT [dbo].[FileTable] ([imageid], [CustomerId], [File]) VALUES (14, N'', 0x530079007300740065006D002E00440072006100770069006E0067002E004200690074006D0061007000)
