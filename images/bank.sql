USE [Bank]
GO
/****** Object:  Table [dbo].[AdminDetails]    Script Date: 12/16/2014 11:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminDetails](
	[EmpId] [varchar](15) NOT NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomersDetails]    Script Date: 12/16/2014 11:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomersDetails](
	[AccountNo] [bigint] NULL,
	[CIFNo] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[AadharNo] [varchar](50) NULL,
	[DateofBirth] [varchar](50) NULL,
	[FatherName] [varchar](50) NULL,
	[FatherOccupation] [varchar](50) NULL,
	[MotherName] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Landline] [varchar](50) NULL,
	[Emailid] [varchar](50) NULL,
	[Adress] [varchar](500) NULL,
	[City] [varchar](50) NULL,
	[PinCode] [varchar](50) NULL,
	[Stat] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
	[Disability] [varchar](50) NULL,
	[Religion] [varchar](50) NULL,
	[Qualification] [varchar](50) NULL,
	[OccupationType] [varchar](50) NULL,
	[CreditLimit] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[AvailableCredit] [varchar](50) NULL,
 CONSTRAINT [PK__CustomersDetails__0EA330E9] PRIMARY KEY CLUSTERED 
(
	[CIFNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MyContacts]    Script Date: 12/16/2014 11:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MyContacts](
	[ContactId] [bigint] IDENTITY(1,1) NOT NULL,
	[MyCIFNo] [varchar](50) NULL,
	[CIFNo] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[TransferLimit] [varchar](10) NULL,
 CONSTRAINT [PK__MyContacts__48CFD27E] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountDetails]    Script Date: 12/16/2014 11:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountDetails](
	[CIFNo] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[ChequeNo] [varchar](15) NULL,
	[Credit] [decimal](18, 0) NULL,
	[Debit] [decimal](18, 0) NULL,
	[FromCifNo] [varchar](50) NULL,
	[ToCifNo] [varchar](50) NULL,
	[Descriptions] [varchar](200) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 12/16/2014 11:49:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Settings](
	[CIFNo] [varchar](50) NULL,
	[CustomerName] [varchar](50) NULL,
	[MinimumAmount] [int] NULL,
	[MaximumAmount] [bigint] NULL,
	[MinimumLoan] [int] NULL,
	[MaximumLoan] [bigint] NULL,
	[TransactionLimit] [bigint] NULL,
	[Descriptions] [varchar](500) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomersFile]    Script Date: 12/16/2014 11:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomersFile](
	[FileId] [bigint] IDENTITY(1,1) NOT NULL,
	[CIFNo] [varchar](50) NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerFileName] [varchar](100) NULL,
	[CustomerFile] [varchar](250) NULL,
	[Descriptions] [varchar](500) NULL,
 CONSTRAINT [PK__CustomersFile__1273C1CD] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__AccountDe__CIFNo__276EDEB3]    Script Date: 12/16/2014 11:49:09 ******/
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD  CONSTRAINT [FK__AccountDe__CIFNo__276EDEB3] FOREIGN KEY([CIFNo])
REFERENCES [dbo].[CustomersDetails] ([CIFNo])
GO
ALTER TABLE [dbo].[AccountDetails] CHECK CONSTRAINT [FK__AccountDe__CIFNo__276EDEB3]
GO
/****** Object:  ForeignKey [FK__AccountDe__FromC__286302EC]    Script Date: 12/16/2014 11:49:09 ******/
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD  CONSTRAINT [FK__AccountDe__FromC__286302EC] FOREIGN KEY([FromCifNo])
REFERENCES [dbo].[CustomersDetails] ([CIFNo])
GO
ALTER TABLE [dbo].[AccountDetails] CHECK CONSTRAINT [FK__AccountDe__FromC__286302EC]
GO
/****** Object:  ForeignKey [FK__AccountDe__ToCif__29572725]    Script Date: 12/16/2014 11:49:09 ******/
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD  CONSTRAINT [FK__AccountDe__ToCif__29572725] FOREIGN KEY([ToCifNo])
REFERENCES [dbo].[CustomersDetails] ([CIFNo])
GO
ALTER TABLE [dbo].[AccountDetails] CHECK CONSTRAINT [FK__AccountDe__ToCif__29572725]
GO
/****** Object:  ForeignKey [FK__Customers__CIFNo__1367E606]    Script Date: 12/16/2014 11:49:15 ******/
ALTER TABLE [dbo].[CustomersFile]  WITH CHECK ADD  CONSTRAINT [FK__Customers__CIFNo__1367E606] FOREIGN KEY([CIFNo])
REFERENCES [dbo].[CustomersDetails] ([CIFNo])
GO
ALTER TABLE [dbo].[CustomersFile] CHECK CONSTRAINT [FK__Customers__CIFNo__1367E606]
GO
/****** Object:  ForeignKey [FK__MyContact__CIFNo__4AB81AF0]    Script Date: 12/16/2014 11:49:16 ******/
ALTER TABLE [dbo].[MyContacts]  WITH CHECK ADD  CONSTRAINT [FK__MyContact__CIFNo__4AB81AF0] FOREIGN KEY([CIFNo])
REFERENCES [dbo].[CustomersDetails] ([CIFNo])
GO
ALTER TABLE [dbo].[MyContacts] CHECK CONSTRAINT [FK__MyContact__CIFNo__4AB81AF0]
GO
/****** Object:  ForeignKey [FK__MyContact__MyCIF__49C3F6B7]    Script Date: 12/16/2014 11:49:16 ******/
ALTER TABLE [dbo].[MyContacts]  WITH CHECK ADD  CONSTRAINT [FK__MyContact__MyCIF__49C3F6B7] FOREIGN KEY([MyCIFNo])
REFERENCES [dbo].[CustomersDetails] ([CIFNo])
GO
ALTER TABLE [dbo].[MyContacts] CHECK CONSTRAINT [FK__MyContact__MyCIF__49C3F6B7]
GO
/****** Object:  ForeignKey [FK__Settings__CIFNo__20C1E124]    Script Date: 12/16/2014 11:49:18 ******/
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK__Settings__CIFNo__20C1E124] FOREIGN KEY([CIFNo])
REFERENCES [dbo].[CustomersDetails] ([CIFNo])
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK__Settings__CIFNo__20C1E124]
GO
