/****** Object:  Database [Order]    Script Date: 6/6/2017 2:29:49 PM ******/
CREATE DATABASE [OrderDB]
GO

/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/6/2017 2:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/6/2017 2:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Qty]) VALUES (N'87971717-3f96-4e0d-bc7a-c89bc3c7a483', N'12a310e0-635c-4b46-b14c-bae0b22d8323', N'02341321-c20b-48b1-a2be-47e67f548f0f', 1)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Qty]) VALUES (N'771ef383-5223-4301-b376-cb907c9e333c', N'12a310e0-635c-4b46-b14c-bae0b22d8323', N'4d261e4a-a657-4add-a0f6-dde6e1464d55', 1)
GO
INSERT [dbo].[Orders] ([Id], [Date]) VALUES (N'12a310e0-635c-4b46-b14c-bae0b22d8323', CAST(N'2017-05-28 00:00:00.0000000' AS DateTime2))
GO
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 6/6/2017 2:29:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER DATABASE [Order] SET  READ_WRITE 
GO
