
CREATE TABLE [dbo].[Admins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsManager] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Offers]    Script Date: 12/10/2018 4:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 12/10/2018 4:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order_Service]    Script Date: 12/10/2018 4:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Service_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/10/2018 4:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[C_Number] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photos]    Script Date: 12/10/2018 4:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/10/2018 4:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[KMNumber] [float] NOT NULL,
	[Type_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Services]    Script Date: 12/10/2018 4:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 12/10/2018 4:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/10/2018 4:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Car_Num] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

GO
INSERT [dbo].[Admins] ([ID], [UserName], [Password], [IsManager]) VALUES (1, N'Ata Sabri', N'01142229025', 1)
GO
INSERT [dbo].[Admins] ([ID], [UserName], [Password], [IsManager]) VALUES (2, N'Ata', N'123456', 0)
GO
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Offers] ON 

GO
INSERT [dbo].[Offers] ([ID], [Name]) VALUES (1, N'العرض الاول')
GO
SET IDENTITY_INSERT [dbo].[Offers] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (6, 2, 3)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (7, 1, 3)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (10, 3, 5)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (11, 4, 1)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (12, 4, 3)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (15, 6, 3)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (16, 6, 1)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (17, 11, 1)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (18, 11, 8)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (19, 11, 5)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (20, 12, 1)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (22, 12, 5)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (23, 13, 3)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (24, 14, 3)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (25, 15, 3)
GO
INSERT [dbo].[Order_Details] ([ID], [Order_ID], [Product_ID]) VALUES (30, 19, 1)
GO
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[order_Service] ON 

GO
INSERT [dbo].[order_Service] ([ID], [Order_ID], [Service_ID]) VALUES (1, 12, 2)
GO
INSERT [dbo].[order_Service] ([ID], [Order_ID], [Service_ID]) VALUES (2, 12, 1)
GO
INSERT [dbo].[order_Service] ([ID], [Order_ID], [Service_ID]) VALUES (3, 12, 3)
GO
INSERT [dbo].[order_Service] ([ID], [Order_ID], [Service_ID]) VALUES (5, 13, 1)
GO
INSERT [dbo].[order_Service] ([ID], [Order_ID], [Service_ID]) VALUES (6, 14, 1)
GO
INSERT [dbo].[order_Service] ([ID], [Order_ID], [Service_ID]) VALUES (7, 15, 1)
GO
INSERT [dbo].[order_Service] ([ID], [Order_ID], [Service_ID]) VALUES (13, 19, 1)
GO
SET IDENTITY_INSERT [dbo].[order_Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (1, CAST(0xA23D0B00 AS Date), 1234566, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (2, CAST(0xD83D0B00 AS Date), 12132324, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (3, CAST(0xDA3D0B00 AS Date), 21212, 2)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (4, CAST(0x453E0B00 AS Date), 1212, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (5, CAST(0x463E0B00 AS Date), 12133, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (6, CAST(0x463E0B00 AS Date), 12343, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (7, CAST(0x463E0B00 AS Date), 1233, 7)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (8, CAST(0x463E0B00 AS Date), 1243, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (9, CAST(0x463E0B00 AS Date), 1243, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (10, CAST(0x463E0B00 AS Date), 1243, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (11, CAST(0x463E0B00 AS Date), 123, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (12, CAST(0x853E0B00 AS Date), 123, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (13, CAST(0x853E0B00 AS Date), 4566, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (14, CAST(0x853E0B00 AS Date), 4566, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (15, CAST(0x853E0B00 AS Date), 4566, 1)
GO
INSERT [dbo].[Orders] ([ID], [Date], [C_Number], [User_ID]) VALUES (19, CAST(0x863E0B00 AS Date), 876, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description], [KMNumber], [Type_ID]) VALUES (1, N'Product 1', 12.99, NULL, 12, 1)
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description], [KMNumber], [Type_ID]) VALUES (3, N'Product 2', 13, N'This Is Product 2', 14, 1)
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description], [KMNumber], [Type_ID]) VALUES (5, N'Product 3', 35, N'This is Product 3', 30, 2)
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description], [KMNumber], [Type_ID]) VALUES (8, N'Product 4', 33, N'This Is Product 4', 45, 2)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

GO
INSERT [dbo].[Services] ([ID], [Name]) VALUES (1, N'Service 1')
GO
INSERT [dbo].[Services] ([ID], [Name]) VALUES (2, N'Service 2')
GO
INSERT [dbo].[Services] ([ID], [Name]) VALUES (3, N'Service 3')
GO
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

GO
INSERT [dbo].[Types] ([ID], [Name]) VALUES (1, N'Type 1')
GO
INSERT [dbo].[Types] ([ID], [Name]) VALUES (2, N'Type 2')
GO
INSERT [dbo].[Types] ([ID], [Name]) VALUES (3, N'Type 3')
GO
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([ID], [Name], [Phone], [Car_Num]) VALUES (1, N'Ata Sabri', N'01142229025', N'123a')
GO
INSERT [dbo].[Users] ([ID], [Name], [Phone], [Car_Num]) VALUES (2, N'Ata Ahmed', N'01020304050', N'146ad')
GO
INSERT [dbo].[Users] ([ID], [Name], [Phone], [Car_Num]) VALUES (3, N'Heba', N'12232343', N'121d')
GO
INSERT [dbo].[Users] ([ID], [Name], [Phone], [Car_Num]) VALUES (4, N'Soha', N'5456', N'12s')
GO
INSERT [dbo].[Users] ([ID], [Name], [Phone], [Car_Num]) VALUES (5, N'Aza', N'12323', N'23d')
GO
INSERT [dbo].[Users] ([ID], [Name], [Phone], [Car_Num]) VALUES (6, N'Mona', N'232', N'333d')
GO
INSERT [dbo].[Users] ([ID], [Name], [Phone], [Car_Num]) VALUES (7, N'Helal Sabri', N'1345678899', N'123df')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Admins__C9F2845614559844]    Script Date: 12/10/2018 4:26:42 PM ******/
ALTER TABLE [dbo].[Admins] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__5C7E359E6F63F3E8]    Script Date: 12/10/2018 4:26:42 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__5E80AD4500660EE0]    Script Date: 12/10/2018 4:26:42 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Car_Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__Order__1BFD2C07] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK__Order_Det__Order__1BFD2C07]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__Produ__1CF15040] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK__Order_Det__Produ__1CF15040]
GO
ALTER TABLE [dbo].[order_Service]  WITH CHECK ADD  CONSTRAINT [FK__order_Ser__Order__02FC7413] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_Service] CHECK CONSTRAINT [FK__order_Ser__Order__02FC7413]
GO
ALTER TABLE [dbo].[order_Service]  WITH CHECK ADD  CONSTRAINT [FK__order_Ser__Servi__03F0984C] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Services] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_Service] CHECK CONSTRAINT [FK__order_Ser__Servi__03F0984C]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Type_ID])
REFERENCES [dbo].[Types] ([ID])
GO
USE [master]
GO
ALTER DATABASE [Salama] SET  READ_WRITE 
GO
