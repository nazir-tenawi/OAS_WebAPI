USE [master]
GO
/****** Object:  Database [db_oas]    Script Date: 4/27/2022 10:47:27 PM ******/
CREATE DATABASE [db_oas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_oas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_oas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_oas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_oas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_oas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_oas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_oas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_oas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_oas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_oas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_oas] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_oas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_oas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_oas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_oas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_oas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_oas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_oas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_oas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_oas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_oas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_oas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_oas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_oas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_oas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_oas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_oas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_oas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_oas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_oas] SET  MULTI_USER 
GO
ALTER DATABASE [db_oas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_oas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_oas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_oas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_oas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_oas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_oas] SET QUERY_STORE = OFF
GO
USE [db_oas]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[AttendanceDate] [date] NOT NULL,
	[CheckInTime] [datetime] NULL,
	[CheckOutTime] [datetime] NULL,
	[LessTimeReason] [nvarchar](150) NULL,
	[DailyWorkingTimeInMin] [int] NULL,
	[CompanyId] [int] NULL,
	[AllowOfficeLessTime] [int] NULL,
	[IsLeave] [bit] NULL,
	[LogInLocation] [nvarchar](150) NULL,
	[LogOutLocation] [nvarchar](150) NULL,
	[deviceName] [nvarchar](256) NULL,
	[brand] [nvarchar](256) NULL,
	[modelName] [nvarchar](256) NULL,
	[osName] [nvarchar](256) NULL,
	[osVersion] [nvarchar](256) NULL,
 CONSTRAINT [PK_ResourceTracker_Attendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](350) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[ImageFileName] [nvarchar](50) NULL,
	[ImageFileId] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedById] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CompanyAdminName] [nvarchar](50) NULL,
	[CompanyAdminEmail] [nvarchar](50) NULL,
	[CompanyAdminLoginID] [nvarchar](50) NULL,
	[HrDirectorCode] [nvarchar](50) NULL,
	[CompanyRegistrationNumber] [nvarchar](50) NULL,
	[CompanyRegistrationExpiryDate] [datetime] NULL,
	[CompanyRegistrationExpiresInDays] [int] NULL,
	[TradeLicenseNumber] [nvarchar](50) NULL,
	[TradeLicenseExpiryDate] [datetime] NULL,
	[TradeLicenseExpiresInDays] [int] NULL,
	[OthersExpiryDate] [datetime] NULL,
	[OthersExpiresInDays] [int] NULL,
	[EstablishmentCardNumber] [nvarchar](50) NULL,
	[EstablishmentCardExpiryDate] [datetime] NULL,
	[EstablishmentCardExpiresInDays] [int] NULL,
	[IsMultiplelogin] [bit] NULL,
	[IsMultipleDevieAllow] [bit] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyAttachements]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyAttachements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[FileName] [nvarchar](150) NOT NULL,
	[BlobName] [nvarchar](150) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedById] [nvarchar](50) NOT NULL,
	[AttachmentTypeId] [int] NULL,
 CONSTRAINT [PK_CompanyAttachements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyHoliday]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyHoliday](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[HolidayDate] [datetime] NULL,
	[TypeId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyProject]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyProject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ProjectName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](550) NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedById] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CompanyProject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](150) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Code] [nvarchar](50) NULL,
	[LineManagerCode] [nvarchar](50) NULL,
	[DepartmentManagerCode] [nvarchar](50) NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Code] [nvarchar](50) NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [nvarchar](50) NOT NULL,
	[EmployeeName] [nvarchar](150) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedById] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedById] [uniqueidentifier] NULL,
	[DesignationId] [int] NULL,
	[DepartmentId] [int] NULL,
	[MobileNo] [nvarchar](50) NULL,
	[StatusId] [int] NULL,
	[ProjectId] [int] NULL,
	[PortalUserId] [uniqueidentifier] NULL,
	[NationalityId] [int] NULL,
	[DateOfBirth] [datetime] NULL,
	[GenderId] [int] NULL,
	[PassportNo] [nvarchar](50) NULL,
	[PassportIssueDate] [datetime] NULL,
	[PassportExpiryDate] [datetime] NULL,
	[QID] [nvarchar](50) NULL,
	[QIDExpiryDate] [datetime] NULL,
	[WorkingCompanyId] [int] NULL,
	[Sponsorship] [nvarchar](150) NULL,
	[VisaNo] [nvarchar](50) NULL,
	[VisaExpirayDate] [datetime] NULL,
	[WorkLocationId] [int] NULL,
	[CompanyAccomodation] [nvarchar](150) NULL,
	[HealthCardNo] [nvarchar](50) NULL,
	[HealthCardExpiryDate] [datetime] NULL,
	[Insurance] [nvarchar](50) NULL,
	[InsuranceExpirayDate] [datetime] NULL,
	[FoodHandling] [nvarchar](50) NULL,
	[FoodhandlingIssueDate] [datetime] NULL,
	[FoodhandlingExpiryDate] [datetime] NULL,
	[LastWorkingDate] [datetime] NULL,
	[DateOfJoining] [datetime] NULL,
	[SponsorshipId] [int] NULL,
	[ImageFileName] [nvarchar](50) NULL,
	[QrCodeNo] [nvarchar](150) NULL,
	[HasAccessQrCodeScan] [bit] NULL,
	[LoginID] [nvarchar](50) NULL,
	[IsDeleteable] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeOtherDetails]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeOtherDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[LeavePolicyId] [int] NULL,
	[LeaveEntitlement] [int] NULL,
	[AirTicketEntitlementTotalMonth] [int] NULL,
	[HiredThrough] [nvarchar](150) NULL,
	[ContractPeriodYear] [int] NULL,
	[LaborContract] [nvarchar](150) NULL,
	[ContractIssueDate] [datetime] NULL,
	[ContractExpiryDate] [datetime] NULL,
	[CompanyID] [nvarchar](50) NULL,
	[MotherTongue] [nvarchar](150) NULL,
	[MaritalStatusId] [int] NULL,
	[ChildrenNo] [int] NULL,
	[ReligionId] [int] NULL,
	[PreviousCompany] [nvarchar](150) NULL,
	[CountryId] [int] NULL,
	[HomeAirport] [nvarchar](150) NULL,
	[CompanyEmailID] [nvarchar](50) NULL,
	[EmailIDs] [nvarchar](350) NULL,
	[EmployeeGroup] [nvarchar](50) NULL,
	[EmployeeSubGroup] [nvarchar](150) NULL,
	[EmployeeOfTheMonth] [nvarchar](50) NULL,
	[UpdaLicense] [nvarchar](50) NULL,
	[Registration] [nvarchar](50) NULL,
	[Grade] [nvarchar](50) NULL,
	[UdpaExpiryDate] [datetime] NULL,
	[Remarks] [nvarchar](500) NULL,
	[MotherTongueId] [int] NULL,
	[EmployeeGroupId] [int] NULL,
	[HomeAirportId] [int] NULL,
 CONSTRAINT [PK_EmployeeOtherDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSalaryStructure]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSalaryStructure](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[BasicPay] [decimal](18, 2) NULL,
	[Housing] [decimal](18, 2) NULL,
	[Transport] [decimal](18, 2) NULL,
	[Telephone] [decimal](18, 2) NULL,
	[FoodAllowance] [decimal](18, 2) NULL,
	[OtherAllowancce] [decimal](18, 2) NULL,
	[TeamLeadAllowance] [decimal](18, 2) NULL,
	[CityCompensatoryAllowance] [decimal](18, 2) NULL,
	[PersonalAllowance] [decimal](18, 2) NULL,
	[OutsideAllowance] [decimal](18, 2) NULL,
	[NetSalary] [decimal](18, 2) NULL,
	[BankName] [nvarchar](150) NULL,
	[EmployeeAccount] [nvarchar](150) NULL,
	[SalaryCategory] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmployeeSalaryStructure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InputHelp]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InputHelp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InputHelpTypeId] [int] NOT NULL,
	[Name] [nvarchar](350) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedById] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedById] [int] NULL,
 CONSTRAINT [PK_InputHelp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveApplication]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveApplication](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[IsHalfDay] [bit] NULL,
	[LeaveTypeId] [int] NOT NULL,
	[LeaveReason] [nvarchar](150) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IsApproved] [bit] NULL,
	[IsRejected] [bit] NULL,
	[RejectReason] [nvarchar](150) NULL,
	[ApprovedById] [uniqueidentifier] NULL,
	[ApprovedAt] [datetime] NULL,
	[StatusId] [int] NULL,
	[IsCorrection] [bit] NULL,
	[NextApproverId] [nvarchar](50) NULL,
	[ApproverSerialId] [int] NULL,
	[RequestNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_ResourceTracker_LeaveApplication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveApprovalRule]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveApprovalRule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestNo] [nvarchar](50) NULL,
	[ApproverId] [nvarchar](50) NULL,
	[IsLastApprover] [bit] NULL,
	[SerialNo] [int] NULL,
	[Approved] [bit] NULL,
	[Rejected] [bit] NULL,
	[UpdatedById] [nvarchar](50) NULL,
	[UpdatedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeavePolicy]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeavePolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PolicyCode] [int] NOT NULL,
	[Description] [nvarchar](350) NOT NULL,
	[LeaveDays] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedById] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedById] [uniqueidentifier] NULL,
 CONSTRAINT [PK_LeavePolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoticeBoard]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoticeBoard](
	[Id] [nvarchar](128) NOT NULL,
	[Details] [nvarchar](max) NULL,
	[PostingDate] [datetime] NOT NULL,
	[ImageFileName] [nvarchar](200) NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](350) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedById] [uniqueidentifier] NULL,
	[CreatedAt] [datetime] NULL,
	[StatusId] [int] NULL,
	[TaskGroupId] [int] NULL,
	[AssignedToId] [uniqueidentifier] NULL,
	[DueDate] [datetime] NULL,
	[CompanyId] [int] NULL,
	[TaskNo] [int] NULL,
	[PriorityId] [int] NULL,
	[UpdatedById] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime] NULL,
	[TaskTypeId] [int] NULL,
	[ContractNumber] [nvarchar](28) NULL,
	[OutDoorAddr] [nvarchar](556) NULL,
	[OurDoorLat] [decimal](18, 10) NULL,
	[OurDoorLong] [decimal](18, 10) NULL,
 CONSTRAINT [PK_ResourceTracker_Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TasKAssignTo]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TasKAssignTo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [uniqueidentifier] NULL,
	[AssignedToId] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskAttachments]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskAttachments](
	[Id] [uniqueidentifier] NOT NULL,
	[TaskId] [uniqueidentifier] NOT NULL,
	[FileName] [nvarchar](150) NOT NULL,
	[BlobName] [nvarchar](50) NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ResourceTracker_TaskAttachments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCredentials]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCredentials](
	[Id] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](350) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[LoginID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CompanyId] [int] NULL,
	[IsFirstLogin] [bit] NULL,
	[UniqueDeviceIdentifier] [nvarchar](556) NULL,
	[deviceName] [nvarchar](256) NULL,
	[brand] [nvarchar](256) NULL,
	[modelName] [nvarchar](256) NULL,
	[osName] [nvarchar](256) NULL,
	[osVersion] [nvarchar](256) NULL,
	[osBuildId] [nvarchar](256) NULL,
	[LastloginTime] [datetime] NULL,
 CONSTRAINT [PK_UserCredentials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMovementLog]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMovementLog](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[LogDateTime] [datetime] NOT NULL,
	[Latitude] [decimal](18, 10) NULL,
	[Longitude] [decimal](18, 10) NULL,
	[LogLocation] [nvarchar](150) NULL,
	[IsCheckInPoint] [bit] NULL,
	[IsCheckOutPoint] [bit] NULL,
	[DeviceName] [nvarchar](256) NULL,
	[DeviceOSVersion] [nvarchar](256) NULL,
	[CompanyId] [int] NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_ResourceTracker_UserMovementLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [CompanyName], [Address], [PhoneNumber], [ImageFileName], [ImageFileId], [CreatedDate], [CreatedById], [IsActive], [CompanyAdminName], [CompanyAdminEmail], [CompanyAdminLoginID], [HrDirectorCode], [CompanyRegistrationNumber], [CompanyRegistrationExpiryDate], [CompanyRegistrationExpiresInDays], [TradeLicenseNumber], [TradeLicenseExpiryDate], [TradeLicenseExpiresInDays], [OthersExpiryDate], [OthersExpiresInDays], [EstablishmentCardNumber], [EstablishmentCardExpiryDate], [EstablishmentCardExpiresInDays], [IsMultiplelogin], [IsMultipleDevieAllow]) VALUES (7, N'localadmin', N'localadmin', N'localadmin', NULL, NULL, CAST(N'2022-04-25T00:08:40.413' AS DateTime), N'f4d24bd8-1052-4007-b164-000311af65b9', 1, N'localadmin', N'localadmin', N'localadm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Company] ([Id], [CompanyName], [Address], [PhoneNumber], [ImageFileName], [ImageFileId], [CreatedDate], [CreatedById], [IsActive], [CompanyAdminName], [CompanyAdminEmail], [CompanyAdminLoginID], [HrDirectorCode], [CompanyRegistrationNumber], [CompanyRegistrationExpiryDate], [CompanyRegistrationExpiresInDays], [TradeLicenseNumber], [TradeLicenseExpiryDate], [TradeLicenseExpiresInDays], [OthersExpiryDate], [OthersExpiresInDays], [EstablishmentCardNumber], [EstablishmentCardExpiryDate], [EstablishmentCardExpiresInDays], [IsMultiplelogin], [IsMultipleDevieAllow]) VALUES (8, N'Electrical Division', N'SA, Riyadh, Malaz', N'0096645674897', NULL, NULL, CAST(N'2022-04-27T19:31:57.657' AS DateTime), N'f4d24bd8-1052-4007-b164-000311af65b9', 1, N'Ahmed Ali', N'ahmed_ali@email.com', N'ahmed_al', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Company] ([Id], [CompanyName], [Address], [PhoneNumber], [ImageFileName], [ImageFileId], [CreatedDate], [CreatedById], [IsActive], [CompanyAdminName], [CompanyAdminEmail], [CompanyAdminLoginID], [HrDirectorCode], [CompanyRegistrationNumber], [CompanyRegistrationExpiryDate], [CompanyRegistrationExpiresInDays], [TradeLicenseNumber], [TradeLicenseExpiryDate], [TradeLicenseExpiresInDays], [OthersExpiryDate], [OthersExpiresInDays], [EstablishmentCardNumber], [EstablishmentCardExpiryDate], [EstablishmentCardExpiresInDays], [IsMultiplelogin], [IsMultipleDevieAllow]) VALUES (9, N'Construction Company', N'SA, Riyadh, Faiha', N'0096687456', NULL, NULL, CAST(N'2022-04-27T19:33:02.943' AS DateTime), N'f4d24bd8-1052-4007-b164-000311af65b9', 1, N'Alaa Ali', N'alaa_ali@email.com', N'alaa_ali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyHoliday] ON 

INSERT [dbo].[CompanyHoliday] ([Id], [Name], [HolidayDate], [TypeId], [CreatedDate], [CompanyId]) VALUES (1, N'Eid Fiter Holiday', CAST(N'2022-04-30T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-27T19:21:48.777' AS DateTime), 7)
INSERT [dbo].[CompanyHoliday] ([Id], [Name], [HolidayDate], [TypeId], [CreatedDate], [CompanyId]) VALUES (2, N'Eid Adha Holiday', CAST(N'2022-07-30T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-27T19:22:01.960' AS DateTime), 7)
SET IDENTITY_INSERT [dbo].[CompanyHoliday] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [DepartmentName], [CreatedDate], [Code], [LineManagerCode], [DepartmentManagerCode], [CompanyId]) VALUES (1, N'a', CAST(N'2022-04-24T20:28:54.747' AS DateTime), N'a', NULL, NULL, 6)
INSERT [dbo].[Department] ([Id], [DepartmentName], [CreatedDate], [Code], [LineManagerCode], [DepartmentManagerCode], [CompanyId]) VALUES (2, N'HR', CAST(N'2022-04-26T18:57:25.070' AS DateTime), N'001', NULL, NULL, 7)
INSERT [dbo].[Department] ([Id], [DepartmentName], [CreatedDate], [Code], [LineManagerCode], [DepartmentManagerCode], [CompanyId]) VALUES (3, N'Sales', CAST(N'2022-04-27T19:24:02.430' AS DateTime), N'002', NULL, NULL, 7)
INSERT [dbo].[Department] ([Id], [DepartmentName], [CreatedDate], [Code], [LineManagerCode], [DepartmentManagerCode], [CompanyId]) VALUES (4, N'ER', CAST(N'2022-04-27T19:24:12.263' AS DateTime), N'003', NULL, NULL, 7)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Name], [CreatedDate], [Code], [CompanyId]) VALUES (1, N'b', CAST(N'2022-04-24T20:29:05.373' AS DateTime), N'22', 6)
INSERT [dbo].[Designation] ([Id], [Name], [CreatedDate], [Code], [CompanyId]) VALUES (2, N'Trading', CAST(N'2022-04-26T18:57:38.673' AS DateTime), N'001', 7)
INSERT [dbo].[Designation] ([Id], [Name], [CreatedDate], [Code], [CompanyId]) VALUES (3, N'Factory', CAST(N'2022-04-27T19:25:06.983' AS DateTime), N'002', 7)
INSERT [dbo].[Designation] ([Id], [Name], [CreatedDate], [Code], [CompanyId]) VALUES (4, N'HO', CAST(N'2022-04-27T19:25:23.940' AS DateTime), N'003', 7)
SET IDENTITY_INSERT [dbo].[Designation] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [EmployeeCode], [EmployeeName], [CreatedAt], [CreatedById], [UpdatedAt], [UpdatedById], [DesignationId], [DepartmentId], [MobileNo], [StatusId], [ProjectId], [PortalUserId], [NationalityId], [DateOfBirth], [GenderId], [PassportNo], [PassportIssueDate], [PassportExpiryDate], [QID], [QIDExpiryDate], [WorkingCompanyId], [Sponsorship], [VisaNo], [VisaExpirayDate], [WorkLocationId], [CompanyAccomodation], [HealthCardNo], [HealthCardExpiryDate], [Insurance], [InsuranceExpirayDate], [FoodHandling], [FoodhandlingIssueDate], [FoodhandlingExpiryDate], [LastWorkingDate], [DateOfJoining], [SponsorshipId], [ImageFileName], [QrCodeNo], [HasAccessQrCodeScan], [LoginID], [IsDeleteable]) VALUES (1, N'111', N'111', CAST(N'2022-04-24T20:29:20.157' AS DateTime), NULL, NULL, NULL, 1, 1, NULL, 1, NULL, N'a870cb2d-2a22-42cb-9300-c05fc98ad094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'111', NULL)
INSERT [dbo].[Employee] ([Id], [EmployeeCode], [EmployeeName], [CreatedAt], [CreatedById], [UpdatedAt], [UpdatedById], [DesignationId], [DepartmentId], [MobileNo], [StatusId], [ProjectId], [PortalUserId], [NationalityId], [DateOfBirth], [GenderId], [PassportNo], [PassportIssueDate], [PassportExpiryDate], [QID], [QIDExpiryDate], [WorkingCompanyId], [Sponsorship], [VisaNo], [VisaExpirayDate], [WorkLocationId], [CompanyAccomodation], [HealthCardNo], [HealthCardExpiryDate], [Insurance], [InsuranceExpirayDate], [FoodHandling], [FoodhandlingIssueDate], [FoodhandlingExpiryDate], [LastWorkingDate], [DateOfJoining], [SponsorshipId], [ImageFileName], [QrCodeNo], [HasAccessQrCodeScan], [LoginID], [IsDeleteable]) VALUES (2, N'user', N'user', CAST(N'2022-04-26T18:58:09.133' AS DateTime), NULL, NULL, NULL, 2, 2, NULL, 1, NULL, N'2becdb8a-d86d-403e-872a-290a83154bf5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'2', NULL, N'user', NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeOtherDetails] ON 

INSERT [dbo].[EmployeeOtherDetails] ([Id], [EmployeeId], [LeavePolicyId], [LeaveEntitlement], [AirTicketEntitlementTotalMonth], [HiredThrough], [ContractPeriodYear], [LaborContract], [ContractIssueDate], [ContractExpiryDate], [CompanyID], [MotherTongue], [MaritalStatusId], [ChildrenNo], [ReligionId], [PreviousCompany], [CountryId], [HomeAirport], [CompanyEmailID], [EmailIDs], [EmployeeGroup], [EmployeeSubGroup], [EmployeeOfTheMonth], [UpdaLicense], [Registration], [Grade], [UdpaExpiryDate], [Remarks], [MotherTongueId], [EmployeeGroupId], [HomeAirportId]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[EmployeeOtherDetails] ([Id], [EmployeeId], [LeavePolicyId], [LeaveEntitlement], [AirTicketEntitlementTotalMonth], [HiredThrough], [ContractPeriodYear], [LaborContract], [ContractIssueDate], [ContractExpiryDate], [CompanyID], [MotherTongue], [MaritalStatusId], [ChildrenNo], [ReligionId], [PreviousCompany], [CountryId], [HomeAirport], [CompanyEmailID], [EmailIDs], [EmployeeGroup], [EmployeeSubGroup], [EmployeeOfTheMonth], [UpdaLicense], [Registration], [Grade], [UdpaExpiryDate], [Remarks], [MotherTongueId], [EmployeeGroupId], [HomeAirportId]) VALUES (2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EmployeeOtherDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeSalaryStructure] ON 

INSERT [dbo].[EmployeeSalaryStructure] ([Id], [EmployeeId], [BasicPay], [Housing], [Transport], [Telephone], [FoodAllowance], [OtherAllowancce], [TeamLeadAllowance], [CityCompensatoryAllowance], [PersonalAllowance], [OutsideAllowance], [NetSalary], [BankName], [EmployeeAccount], [SalaryCategory]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[EmployeeSalaryStructure] ([Id], [EmployeeId], [BasicPay], [Housing], [Transport], [Telephone], [FoodAllowance], [OtherAllowancce], [TeamLeadAllowance], [CityCompensatoryAllowance], [PersonalAllowance], [OutsideAllowance], [NetSalary], [BankName], [EmployeeAccount], [SalaryCategory]) VALUES (2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EmployeeSalaryStructure] OFF
GO
SET IDENTITY_INSERT [dbo].[InputHelp] ON 

INSERT [dbo].[InputHelp] ([Id], [InputHelpTypeId], [Name], [IsActive], [CreatedAt], [CreatedById], [UpdatedAt], [UpdatedById]) VALUES (1, 8, N'AA', 1, CAST(N'2022-04-23T13:12:41.867' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[InputHelp] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveApplication] ON 

INSERT [dbo].[LeaveApplication] ([Id], [CompanyId], [EmployeeId], [FromDate], [ToDate], [IsHalfDay], [LeaveTypeId], [LeaveReason], [CreatedAt], [IsApproved], [IsRejected], [RejectReason], [ApprovedById], [ApprovedAt], [StatusId], [IsCorrection], [NextApproverId], [ApproverSerialId], [RequestNo]) VALUES (1, 7, 2, CAST(N'2022-04-26T22:05:58.000' AS DateTime), CAST(N'2022-04-26T22:05:58.000' AS DateTime), 0, 1, N'123', CAST(N'2022-04-26T22:06:07.000' AS DateTime), 1, 0, N'', N'4f20b4be-66e0-4f07-b419-bdf23f692b9f', CAST(N'2022-04-26T19:07:03.463' AS DateTime), 1, 0, NULL, NULL, N'L000001')
SET IDENTITY_INSERT [dbo].[LeaveApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[LeavePolicy] ON 

INSERT [dbo].[LeavePolicy] ([Id], [PolicyCode], [Description], [LeaveDays], [CreatedDate], [CreatedById], [UpdatedAt], [UpdatedById]) VALUES (1, 1, N'Outside Meeting', NULL, CAST(N'2022-04-26T19:05:39.283' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[LeavePolicy] ([Id], [PolicyCode], [Description], [LeaveDays], [CreatedDate], [CreatedById], [UpdatedAt], [UpdatedById]) VALUES (2, 2, N'Sick Leave', NULL, CAST(N'2022-04-27T19:20:33.097' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[LeavePolicy] ([Id], [PolicyCode], [Description], [LeaveDays], [CreatedDate], [CreatedById], [UpdatedAt], [UpdatedById]) VALUES (3, 3, N'Emergency Leave', NULL, CAST(N'2022-04-27T19:20:54.660' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LeavePolicy] OFF
GO
INSERT [dbo].[UserCredentials] ([Id], [FullName], [Email], [ContactNo], [LoginID], [Password], [UserTypeId], [IsActive], [CreatedAt], [CompanyId], [IsFirstLogin], [UniqueDeviceIdentifier], [deviceName], [brand], [modelName], [osName], [osVersion], [osBuildId], [LastloginTime]) VALUES (N'f4d24bd8-1052-4007-b164-000311af65b9', N'Super Admin', N'qw', N'12', N'superadmin', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserCredentials] ([Id], [FullName], [Email], [ContactNo], [LoginID], [Password], [UserTypeId], [IsActive], [CreatedAt], [CompanyId], [IsFirstLogin], [UniqueDeviceIdentifier], [deviceName], [brand], [modelName], [osName], [osVersion], [osBuildId], [LastloginTime]) VALUES (N'2becdb8a-d86d-403e-872a-290a83154bf5', N'user', NULL, NULL, N'user', N'EE11CBB19052E40B07AAC0CA060C23EE', 5, 1, CAST(N'2022-04-26T18:58:09.133' AS DateTime), 7, NULL, N'M2012K10CSP1A.210812.016SP1A.210812.016', N'M2012K10C', N'Redmi', N'M2012K10C', N'Android', N'12', N'SP1A.210812.016', CAST(N'2022-04-27T19:44:20.813' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [FullName], [Email], [ContactNo], [LoginID], [Password], [UserTypeId], [IsActive], [CreatedAt], [CompanyId], [IsFirstLogin], [UniqueDeviceIdentifier], [deviceName], [brand], [modelName], [osName], [osVersion], [osBuildId], [LastloginTime]) VALUES (N'ac5f8567-9954-4e17-bccd-887910418411', N'Alaa Ali', N'alaa_ali@email.com', N'0096687456', N'alaa_ali', N'47C1B27D46D199D46A808B480A509B2B', 2, 1, CAST(N'2022-04-27T19:33:02.943' AS DateTime), 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserCredentials] ([Id], [FullName], [Email], [ContactNo], [LoginID], [Password], [UserTypeId], [IsActive], [CreatedAt], [CompanyId], [IsFirstLogin], [UniqueDeviceIdentifier], [deviceName], [brand], [modelName], [osName], [osVersion], [osBuildId], [LastloginTime]) VALUES (N'4f20b4be-66e0-4f07-b419-bdf23f692b9f', N'localadmin', N'localadmin', N'localadmin', N'localadm', N'3926252716CE9B4543F8BF8D424C2D65', 2, 1, CAST(N'2022-04-25T00:08:40.413' AS DateTime), 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserCredentials] ([Id], [FullName], [Email], [ContactNo], [LoginID], [Password], [UserTypeId], [IsActive], [CreatedAt], [CompanyId], [IsFirstLogin], [UniqueDeviceIdentifier], [deviceName], [brand], [modelName], [osName], [osVersion], [osBuildId], [LastloginTime]) VALUES (N'c26224a8-c406-4c46-abfc-cc887bbdb302', N'Ahmed Ali', N'ahmed_ali@email.com', N'0096645674897', N'ahmed_al', N'CBCF86148D1050EB387E733EBFE4873D', 2, 1, CAST(N'2022-04-27T19:31:57.657' AS DateTime), 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserMovementLog] ([Id], [UserId], [LogDateTime], [Latitude], [Longitude], [LogLocation], [IsCheckInPoint], [IsCheckOutPoint], [DeviceName], [DeviceOSVersion], [CompanyId], [Note]) VALUES (N'52dd90b1-58f2-49ef-8669-1c5a4da7a852', N'2becdb8a-d86d-403e-872a-290a83154bf5', CAST(N'2022-04-27T19:05:09.613' AS DateTime), CAST(24.7399671000 AS Decimal(18, 10)), CAST(46.7065500000 AS Decimal(18, 10)), N'Salmah Ibn Muawiyah, Riyadh, Saudi Arabia', NULL, NULL, N'Redmi K40 Gaming', N'12', 7, N'Check Point Evening')
INSERT [dbo].[UserMovementLog] ([Id], [UserId], [LogDateTime], [Latitude], [Longitude], [LogLocation], [IsCheckInPoint], [IsCheckOutPoint], [DeviceName], [DeviceOSVersion], [CompanyId], [Note]) VALUES (N'bd8f1e4a-7b43-466c-a383-1eecb34a45e7', N'2becdb8a-d86d-403e-872a-290a83154bf5', CAST(N'2022-04-27T19:04:44.123' AS DateTime), CAST(24.7399648000 AS Decimal(18, 10)), CAST(46.7065507000 AS Decimal(18, 10)), N'Salmah Ibn Muawiyah, Riyadh, Saudi Arabia', 1, NULL, N'Redmi K40 Gaming', N'12', 7, NULL)
INSERT [dbo].[UserMovementLog] ([Id], [UserId], [LogDateTime], [Latitude], [Longitude], [LogLocation], [IsCheckInPoint], [IsCheckOutPoint], [DeviceName], [DeviceOSVersion], [CompanyId], [Note]) VALUES (N'f37380bd-f456-46eb-a3c3-6c5b830ed2da', N'2becdb8a-d86d-403e-872a-290a83154bf5', CAST(N'2022-04-27T19:05:13.327' AS DateTime), CAST(24.7399750000 AS Decimal(18, 10)), CAST(46.7065511000 AS Decimal(18, 10)), N'Salmah Ibn Muawiyah, Riyadh, Saudi Arabia', NULL, 1, N'Redmi K40 Gaming', N'12', 7, NULL)
INSERT [dbo].[UserMovementLog] ([Id], [UserId], [LogDateTime], [Latitude], [Longitude], [LogLocation], [IsCheckInPoint], [IsCheckOutPoint], [DeviceName], [DeviceOSVersion], [CompanyId], [Note]) VALUES (N'a0858d2a-aa57-47a2-b460-721124f4dc65', N'2becdb8a-d86d-403e-872a-290a83154bf5', CAST(N'2022-04-26T19:02:24.080' AS DateTime), CAST(24.7399977000 AS Decimal(18, 10)), CAST(46.7065470000 AS Decimal(18, 10)), N'Salmah Ibn Muawiyah, Riyadh, Saudi Arabia', 1, NULL, N'Redmi K40 Gaming', N'12', 7, NULL)
INSERT [dbo].[UserMovementLog] ([Id], [UserId], [LogDateTime], [Latitude], [Longitude], [LogLocation], [IsCheckInPoint], [IsCheckOutPoint], [DeviceName], [DeviceOSVersion], [CompanyId], [Note]) VALUES (N'ff6387cb-383d-4399-8d2c-d05306df17bf', N'2becdb8a-d86d-403e-872a-290a83154bf5', CAST(N'2022-04-26T19:02:36.593' AS DateTime), CAST(24.7399977000 AS Decimal(18, 10)), CAST(46.7065470000 AS Decimal(18, 10)), N'Salmah Ibn Muawiyah, Riyadh, Saudi Arabia', NULL, NULL, N'Redmi K40 Gaming', N'12', 7, N'Sss')
INSERT [dbo].[UserMovementLog] ([Id], [UserId], [LogDateTime], [Latitude], [Longitude], [LogLocation], [IsCheckInPoint], [IsCheckOutPoint], [DeviceName], [DeviceOSVersion], [CompanyId], [Note]) VALUES (N'2e30985f-b946-4e56-b8ef-dd75afd61d2b', N'2becdb8a-d86d-403e-872a-290a83154bf5', CAST(N'2022-04-26T19:02:41.117' AS DateTime), CAST(24.7399791000 AS Decimal(18, 10)), CAST(46.7065520000 AS Decimal(18, 10)), N'Salmah Ibn Muawiyah, Riyadh, Saudi Arabia', NULL, 1, N'Redmi K40 Gaming', N'12', 7, NULL)
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_UserCredentials] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[UserCredentials] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_UserCredentials]
GO
ALTER TABLE [dbo].[CompanyAttachements]  WITH CHECK ADD  CONSTRAINT [FK_CompanyAttachements_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[CompanyAttachements] CHECK CONSTRAINT [FK_CompanyAttachements_Company]
GO
ALTER TABLE [dbo].[CompanyProject]  WITH CHECK ADD  CONSTRAINT [FK_CompanyProject_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[CompanyProject] CHECK CONSTRAINT [FK_CompanyProject_Company]
GO
ALTER TABLE [dbo].[EmployeeOtherDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeOtherDetails_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeOtherDetails] CHECK CONSTRAINT [FK_EmployeeOtherDetails_Employee]
GO
ALTER TABLE [dbo].[EmployeeSalaryStructure]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalaryStructure_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeSalaryStructure] CHECK CONSTRAINT [FK_EmployeeSalaryStructure_Employee]
GO
ALTER TABLE [dbo].[LeaveApplication]  WITH CHECK ADD  CONSTRAINT [FK_ResourceTracker_LeaveApplication_ResourceTracker_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[LeaveApplication] CHECK CONSTRAINT [FK_ResourceTracker_LeaveApplication_ResourceTracker_Company]
GO
ALTER TABLE [dbo].[TaskAttachments]  WITH CHECK ADD  CONSTRAINT [FK_ResourceTracker_TaskAttachments_ResourceTracker_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([Id])
GO
ALTER TABLE [dbo].[TaskAttachments] CHECK CONSTRAINT [FK_ResourceTracker_TaskAttachments_ResourceTracker_Task]
GO
/****** Object:  StoredProcedure [dbo].[Company_Save]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Company_Save]
  @Id INT,
  @HrDirectorCode NVARCHAR(50),
  @CompanyName NVARCHAR(50),
  @Address nvarchar(150),
  @PhoneNumber nvarchar(50),
  @CreatedById uniqueidentifier,
  @IsActive bit,
  @IsMultipleDevieAllow BIT,
  @CompanyAdminName nvarchar(50),
  @CompanyAdminEmail nvarchar(50),
  @CompanyAdminLoginID nvarchar(50),
  @CompanyAdminPassword nvarchar(50),
  @UserKey nvarchar(50),
  @CreatedDate datetime,
  @CompanyRegistrationNumber NVARCHAR(50),
  @CompanyRegistrationExpiryDate DATETIME,
  @CompanyRegistrationExpiresInDays int,
  @EstablishmentCardNumber NVARCHAR(50),
  @EstablishmentCardExpiryDate DATETIME,
  @EstablishmentCardExpiresInDays INT,
  @TradeLicenseNumber NVARCHAR(50),
  @TradeLicenseExpiryDate DATETIME,
  @TradeLicenseExpiresInDays INT,
  @OthersExpiryDate DATETIME,
  @OthersExpiresInDays int,
  @ReturnId INT OUT
AS
BEGIN
  SET NOCOUNT ON;

  IF NOT EXISTS(SELECT TOP 1 * FROM Company C WHERE C.Id=@Id)
    BEGIN
    DECLARE @cId INT
    INSERT INTO Company(CompanyName,HrDirectorCode,Address,PhoneNumber,CreatedDate,CreatedById,IsActive,CompanyAdminName,CompanyAdminEmail,
    CompanyAdminLoginID,CompanyRegistrationNumber,CompanyRegistrationExpiryDate,CompanyRegistrationExpiresInDays,EstablishmentCardNumber,
    EstablishmentCardExpiryDate,EstablishmentCardExpiresInDays,TradeLicenseNumber,TradeLicenseExpiryDate,TradeLicenseExpiresInDays,
    OthersExpiryDate,OthersExpiresInDays,IsMultipleDevieAllow) 
    VALUES(@CompanyName,@HrDirectorCode,@Address,@PhoneNumber,@CreatedDate,@CreatedById,1,@CompanyAdminName,@CompanyAdminEmail,@CompanyAdminLoginID,
    @CompanyRegistrationNumber,@CompanyRegistrationExpiryDate,@CompanyRegistrationExpiresInDays,@EstablishmentCardNumber,@EstablishmentCardExpiryDate,
    @EstablishmentCardExpiresInDays,@TradeLicenseNumber,@TradeLicenseExpiryDate,@TradeLicenseExpiresInDays,@OthersExpiryDate,@OthersExpiresInDays,@IsMultipleDevieAllow)
    SET @cId=SCOPE_IDENTITY()
    INSERT INTO UserCredentials(Id,FullName,Email,LoginID,Password,UserTypeId,IsActive,CreatedAt,CompanyId,ContactNo)
    VALUES(@UserKey,@CompanyAdminName,@CompanyAdminEmail,@CompanyAdminLoginID,@CompanyAdminPassword,2,1,@CreatedDate,@cId,@PhoneNumber)
    SET @ReturnId=@cId
    END
    ELSE
    BEGIN
    UPDATE Company  SET
    CompanyName=@CompanyName,
    HrDirectorCode=@HrDirectorCode,
    Address =@Address,
    PhoneNumber = @PhoneNumber,
    CompanyAdminName=@CompanyAdminName,
    CompanyAdminEmail=@CompanyAdminEmail,
    IsActive=@IsActive,
    CompanyRegistrationNumber=@CompanyRegistrationNumber,
    CompanyRegistrationExpiryDate=@CompanyRegistrationExpiryDate,
    CompanyRegistrationExpiresInDays=@CompanyRegistrationExpiresInDays,
    EstablishmentCardNumber=@EstablishmentCardNumber,
    EstablishmentCardExpiryDate=@EstablishmentCardExpiryDate,
    EstablishmentCardExpiresInDays=@EstablishmentCardExpiresInDays,
    TradeLicenseNumber=@TradeLicenseNumber,
    TradeLicenseExpiryDate=@TradeLicenseExpiryDate,
    TradeLicenseExpiresInDays=@TradeLicenseExpiresInDays,
    OthersExpiryDate=@OthersExpiryDate,
    OthersExpiresInDays=@OthersExpiresInDays,
    IsMultipleDevieAllow=@IsMultipleDevieAllow
    WHERE Id=@Id
    SET @ReturnId=@Id
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Document_Expiry_EmployeeList]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Document_Expiry_EmployeeList]
	@expiryId int,
	@companyId int
AS
BEGIN
	SET NOCOUNT ON;
	
	 IF @expiryId =1
	 SELECT DISTINCT E.Id,e.EmployeeCode,e.EmployeeName,e.MobileNo,e.PassportNo,e.PassportExpiryDate
	,e.QID,e.QIDExpiryDate,e.VisaNo,e.VisaExpirayDate,E.HealthCardNo,E.HealthCardExpiryDate
	FROM Employee E
	 where e.HealthCardExpiryDate is not null and e.HealthCardExpiryDate<GETDATE()
                                     and (@companyId is null or e.WorkingCompanyId=@companyId)
	IF @expiryId =2
	 SELECT DISTINCT E.Id,e.EmployeeCode,e.EmployeeName,e.MobileNo,e.PassportNo,e.PassportExpiryDate
	,e.QID,e.QIDExpiryDate,e.VisaNo,e.VisaExpirayDate,E.HealthCardNo,E.HealthCardExpiryDate
	FROM Employee E
	where e.HealthCardExpiryDate is not null and DATEDIFF(DAY, GETDATE(), e.HealthCardExpiryDate)>=61 and DATEDIFF(DAY, GETDATE(), e.HealthCardExpiryDate)<=90
                                     and (@companyId is null or e.WorkingCompanyId=@companyId)
	IF @expiryId =3
	 SELECT DISTINCT E.Id,e.EmployeeCode,e.EmployeeName,e.MobileNo,e.PassportNo,e.PassportExpiryDate
	,e.QID,e.QIDExpiryDate,e.VisaNo,e.VisaExpirayDate,E.HealthCardNo,E.HealthCardExpiryDate
	FROM Employee E
	 where e.HealthCardExpiryDate is not null and DATEDIFF(DAY, GETDATE(), e.HealthCardExpiryDate)>=31 and DATEDIFF(DAY, GETDATE(), e.HealthCardExpiryDate)<=60
                                     and (@companyId is null or e.WorkingCompanyId=@companyId)
	IF @expiryId =4
	 SELECT DISTINCT E.Id,e.EmployeeCode,e.EmployeeName,e.MobileNo,e.PassportNo,e.PassportExpiryDate
	,e.QID,e.QIDExpiryDate,e.VisaNo,e.VisaExpirayDate,E.HealthCardNo,E.HealthCardExpiryDate
	FROM Employee E
	where e.HealthCardExpiryDate is not null and DATEDIFF(DAY, GETDATE(), e.HealthCardExpiryDate)>=0 and DATEDIFF(DAY, GETDATE(), e.HealthCardExpiryDate)<=30
                                     and (@companyId is null or e.WorkingCompanyId=@companyId)
END



GO
/****** Object:  StoredProcedure [dbo].[Employee_Leave_Approve]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_Leave_Approve]
	@RequestNo NVARCHAR(50),
	@Approved BIT,
	@Rejected BIT,
	@LeaveApproved INT,
	@LeaveRejected INT,
	@SerialNo INT,
	@RejectReason NVARCHAR(200),
	@ApproverId NVARCHAR(50),
	@UpdatedById NVARCHAR(50),
	@UpdatedAt DATETIME
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE LeaveApprovalRule SET
	Approved=@Approved,
	Rejected=@Rejected,
	UpdatedById=@UpdatedById,
	UpdatedAt=@UpdatedAt
	WHERE RequestNo=@RequestNo AND ApproverId=@ApproverId AND SerialNo=@SerialNo

	DECLARE @IsLastApprover BIT
	
	SELECT TOP 1 @IsLastApprover=LA.IsLastApprover FROM LeaveApprovalRule LA WHERE RequestNo=@RequestNo AND ApproverId=@ApproverId AND SerialNo=@SerialNo

	IF @IsLastApprover=1
	BEGIN
	UPDATE LeaveApplication SET StatusId=@LeaveApproved,NextApproverId=null,ApprovedById=@UpdatedById,ApprovedAt=@UpdatedAt WHERE RequestNo=@RequestNo
	END
	ELSE
	BEGIN
		DECLARE @NextApproverId NVARCHAR(50),@ApproverSerialId INT
		SELECT TOP 1 @NextApproverId=LA.ApproverId,@ApproverSerialId=LA.SerialNo FROM LeaveApprovalRule LA WHERE LA.RequestNo=@RequestNo AND LA.SerialNo>@SerialNo ORDER BY LA.SerialNo 

		IF @NextApproverId IS NOT NULL
		BEGIN
		UPDATE LeaveApplication SET NextApproverId=@NextApproverId,ApproverSerialId=@ApproverSerialId WHERE RequestNo=@RequestNo
		END
	END
	IF @Rejected=1
	BEGIN
	UPDATE LeaveApplication SET StatusId=@LeaveRejected, RejectReason=@RejectReason,ApprovedById=@UpdatedById,ApprovedAt=@UpdatedAt WHERE RequestNo=@RequestNo
	END
END


GO
/****** Object:  StoredProcedure [dbo].[Employee_Leave_Save]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_Leave_Save]
	@CompanyId INT,
	@userId NVARCHAR(50),
	@FromDate DATETIME,
	@ToDate DATETIME,
	@IsHalfDay BIT,
	@LeaveTypeId INT,
	@LeaveReason NVARCHAR(150),
	@CreatedAt DATETIME,
	@IsApproved BIT,
	@IsCorrection BIT,
	@IsRejected BIT,
	@RejectReason NVARCHAR(150),
	@ApprovedById NVARCHAR(50),
	@ApprovedAt DATETIME,
	@StatusId INT
AS
BEGIN
	SET NOCOUNT ON;
	Declare @a int=1,@RequestReturnID varchar(10);
	SELECT TOP 1 @a=ISNULL(R.Id,0)+1 FROM LeaveApplication R ORDER BY R.RequestNo desc;
	Select @RequestReturnID='L'+REPLACE(STR(@a, 6), SPACE(1), '0')
    DECLARE @employeeId INT
    SELECT TOP 1 @employeeId=U.Id FROM Employee U WHERE U.PortalUserId=@userId
    INSERT INTO LeaveApplication (RequestNo,CompanyId ,EmployeeId ,FromDate ,ToDate ,IsHalfDay,LeaveTypeId ,LeaveReason,CreatedAt,StatusId,IsApproved,IsCorrection,IsRejected,RejectReason,ApprovedById,ApprovedAt) 
    VALUES (@RequestReturnID,@CompanyId ,@employeeId ,@FromDate ,@ToDate,@IsHalfDay,@LeaveTypeId ,@LeaveReason,@CreatedAt,@StatusId,@IsApproved,@IsCorrection,@IsRejected,@RejectReason,@ApprovedById,@ApprovedAt)

	-- Approval Flow , LineManager->DepartmentManager->HrDirector

	DECLARE @LineManagerId NVARCHAR(50)
	SELECT TOP 1 @LineManagerId=E.PortalUserId FROM Employee E
	WHERE E.EmployeeCode=(SELECT TOP 1 LineManagerCode from Department
	WHERE Id=(SELECT TOP 1 DepartmentId from Employee where PortalUserId=@userId))
	IF @LineManagerId IS NOT NULL
	BEGIN
	INSERT INTO LeaveApprovalRule(RequestNo,ApproverId,IsLastApprover,SerialNo,Approved,Rejected)
	VALUES(@RequestReturnID,@LineManagerId,0,1,0,0)
	END
	DECLARE @DepartmentManagerId NVARCHAR(50)
	SELECT TOP 1 @DepartmentManagerId=E.PortalUserId FROM Employee E
	WHERE E.EmployeeCode=(SELECT TOP 1 DepartmentManagerCode from Department
	WHERE Id=(SELECT TOP 1 DepartmentId from Employee where PortalUserId=@userId))
	IF @DepartmentManagerId IS NOT NULL
	BEGIN
	INSERT INTO LeaveApprovalRule(RequestNo,ApproverId,IsLastApprover,SerialNo,Approved,Rejected)
	VALUES(@RequestReturnID,@DepartmentManagerId,0,2,0,0)
	END
	DECLARE @HrDirectorId NVARCHAR(50)
	select top 1 @HrDirectorId=e.PortalUserId from Employee e where e.EmployeeCode=(select top 1 HrDirectorCode from Company c where c.Id=@CompanyId)
	IF @HrDirectorId IS NOT NULL
	BEGIN
	INSERT INTO LeaveApprovalRule(RequestNo,ApproverId,IsLastApprover,SerialNo,Approved,Rejected)
	VALUES(@RequestReturnID,@HrDirectorId,1,3,0,0)
	END

	declare @NextApproverId nvarchar(50),@ApproverSerialId int
	select top 1 @NextApproverId=L.ApproverId,@ApproverSerialId=L.SerialNo from LeaveApprovalRule L where L.RequestNo=@RequestReturnID order by L.SerialNo
	update LeaveApplication set NextApproverId=@NextApproverId,ApproverSerialId=@ApproverSerialId where RequestNo=@RequestReturnID
	
	--In Case Hr Director or other User is missing
	declare @LastApprovalSerialId int
	SELECT TOP 1 @LastApprovalSerialId=LR.Id from LeaveApprovalRule LR where LR.RequestNo=@RequestReturnID ORDER BY LR.SerialNo DESC
	UPDATE LeaveApprovalRule SET IsLastApprover=1 WHERE Id=@LastApprovalSerialId
END


GO
/****** Object:  StoredProcedure [dbo].[Employee_Save_BasicInfo]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_Save_BasicInfo]
	@Id BIGINT,
	@EmployeeCode NVARCHAR(100),
	@EmployeeName NVARCHAR(150),
	@LoginID NVARCHAR(10),
	@EmployeePassword nvarchar(150),
	@PortalUserId UNIQUEIDENTIFIER,
	@EmployeeStatusId INT,
	@HasAccessQrCodeScan BIT,
	@DesignationId INT,
	@DepartmentId INT,
	@MobileNo NVARCHAR(50),
	@ProjectId INT,
	@NationalityId INT,
	@DateOfBirth DATETIME,
	@GenderId INT,
	@PassportNo NVARCHAR(150),
	@PassportIssueDate DATETIME,
	@PassportExpiryDate DATETIME,
	@QID NVARCHAR(50),
	@QIDExpiryDate DATETIME,
	@WorkingCompanyId INT,
	@SponsorshipId INT,
	@VisaNo NVARCHAR(50),
	@VisaExpirayDate DATETIME,
	@WorkLocationId INT,
	@CompanyAccomodation NVARCHAR(150),
	@HealthCardNo NVARCHAR(150),
	@HealthCardExpiryDate DATETIME,
	@Insurance  NVARCHAR(150),
	@InsuranceExpirayDate  DATETIME,
	@FoodHandling  NVARCHAR(150),
	@FoodhandlingIssueDate DATETIME,
	@FoodhandlingExpiryDate DATETIME,
	@LastWorkingDate DATETIME,
	@DateOfJoining DATETIME,
	@ActionAt DATETIME,
	@ActionById uniqueidentifier,
	@ImageFileName nvarchar(50),
	@ReturnId INT OUT
AS
BEGIN
	SET NOCOUNT ON;

	IF  NOT EXISTS  (SELECT * FROM Employee WHERE Id=@Id)
		BEGIN
		IF NOT EXISTS(SELECT * FROM UserCredentials C WHERE C.LoginID=@LoginID)
		BEGIN
		  INSERT INTO UserCredentials(Id,FullName,Email,ContactNo,LoginID,Password,UserTypeId,IsActive,CreatedAt,CompanyId)
		  VALUES(@PortalUserId,@EmployeeName,NULL,@MobileNo,@LoginID,@EmployeePassword,5,1,@ActionAt,@WorkingCompanyId)
		END
		ELSE
		BEGIN
		 SELECT TOP 1 @PortalUserId=C.Id FROM UserCredentials C WHERE C.LoginID=@EmployeeCode
		END
			INSERT INTO Employee(EmployeeCode,EmployeeName,LoginID,StatusId,DepartmentId,DesignationId,MobileNo,
			ProjectId,NationalityId,DateOfBirth,GenderId,PassportNo,PassportIssueDate,PassportExpiryDate,
			QID,QIDExpiryDate,WorkingCompanyId,SponsorshipId,VisaNo,VisaExpirayDate,WorkLocationId,CompanyAccomodation,HealthCardNo,
			HealthCardExpiryDate,Insurance,InsuranceExpirayDate,FoodHandling,FoodhandlingIssueDate,FoodhandlingExpiryDate,
			LastWorkingDate,DateOfJoining,CreatedAt,CreatedById,PortalUserId,ImageFileName,HasAccessQrCodeScan)
			VALUES(@EmployeeCode,@EmployeeName,@LoginID,@EmployeeStatusId,@DepartmentId,@DesignationId,@MobileNo,
			@ProjectId,@NationalityId,@DateOfBirth,@GenderId,@PassportNo,@PassportIssueDate,@PassportExpiryDate,
			@QID,@QIDExpiryDate,@WorkingCompanyId,@SponsorshipId,@VisaNo,@VisaExpirayDate,@WorkLocationId,@CompanyAccomodation,@HealthCardNo,
			@HealthCardExpiryDate,@Insurance,@InsuranceExpirayDate,@FoodHandling,@FoodhandlingIssueDate,@FoodhandlingExpiryDate,
			@LastWorkingDate,@DateOfJoining,@ActionAt,@ActionById,@PortalUserId,@ImageFileName,@HasAccessQrCodeScan)
			SET @ReturnId=SCOPE_IDENTITY()
			END				
	ELSE
		BEGIN
					UPDATE Employee SET 
						EmployeeCode=@EmployeeCode,
						EmployeeName=@EmployeeName,
						DepartmentId=@departmentId,
						DesignationId=@DesignationId,
						StatusId=@EmployeeStatusId,
						MobileNo=@MobileNo,
						ProjectId=@ProjectId,
						NationalityId=@NationalityId,
						DateOfBirth=@DateOfBirth,
						GenderId=@GenderId,
						PassportNo=@PassportNo,
						PassportIssueDate=@PassportIssueDate,
						PassportExpiryDate=@PassportExpiryDate,
						QID=@QID,
						QIDExpiryDate=@QIDExpiryDate,
						WorkingCompanyId=@WorkingCompanyId,
						SponsorshipId=@SponsorshipId,
						VisaNo=@VisaNo,
						VisaExpirayDate=@VisaExpirayDate,
						WorkLocationId=@WorkLocationId,
						CompanyAccomodation=@CompanyAccomodation,
						HealthCardNo=@HealthCardNo,
						HealthCardExpiryDate=@HealthCardExpiryDate,
						Insurance=@Insurance,
						InsuranceExpirayDate=@InsuranceExpirayDate,
						FoodHandling=@FoodHandling,

						FoodhandlingIssueDate=@FoodhandlingIssueDate,
						FoodhandlingExpiryDate=@FoodhandlingExpiryDate,
						LastWorkingDate=@LastWorkingDate,
						DateOfJoining=@DateOfJoining,
						ImageFileName=@ImageFileName,
						UpdatedAt=@ActionAt,
						UpdatedById=@ActionById,
						HasAccessQrCodeScan=@HasAccessQrCodeScan
						
					WHERE Id=@Id
							
					SET @ReturnId=@Id

				   UPDATE UserCredentials SET LoginID=@LoginID,FullName=@EmployeeName,CompanyId=@WorkingCompanyId WHERE Id=@PortalUserId
		END
END

GO
/****** Object:  StoredProcedure [dbo].[Employee_Save_OtherDetails]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_Save_OtherDetails]
	@EmployeeId BIGINT,
	@ContractPeriodYear INT,
	@LaborContract NVARCHAR(150),
	@ContractIssueDate datetime,
	@ContractExpiryDate datetime,
	@CompanyID NVARCHAR(150),
	@MotherTongueId INT,
	@MaritalStatusId INT,
	@ChildrenNo int,
	@ReligionId INT,
	@PreviousCompany NVARCHAR(150),
	@CountryId INT,
	@HomeAirportId INT,
	@CompanyEmailID NVARCHAR(150),
	@EmailIDs NVARCHAR(150),
	@EmployeeGroupId INT,
	@EmployeeSubGroup  NVARCHAR(150),
	@EmployeeOfTheMonth  NVARCHAR(150),
	@UpdaLicense  NVARCHAR(150),
	@Registration NVARCHAR(150),
	@Grade NVARCHAR(150),
	@UdpaExpiryDate datetime,
	@Remarks NVARCHAR(350),
	@LeaveEntitlement INT,
	@AirTicketEntitlementTotalMonth int,
	@HiredThrough NVARCHAR(150),
	@LeavePolicyCode NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @LeavePolicyId INT

		SELECT TOP 1 @LeavePolicyId=Id FROM LeavePolicy WHERE PolicyCode=@LeavePolicyCode

	IF  NOT EXISTS  (SELECT * FROM EmployeeOtherDetails WHERE EmployeeId=@EmployeeId)
		BEGIN

			INSERT INTO EmployeeOtherDetails(EmployeeId,LeavePolicyId,ContractPeriodYear,LaborContract,ContractIssueDate,ContractExpiryDate,
			CompanyID,MotherTongueId,MaritalStatusId,ChildrenNo,ReligionId,PreviousCompany,CountryId,HomeAirportId,CompanyEmailID,EmailIDs,
			EmployeeGroupId,EmployeeSubGroup,EmployeeOfTheMonth,UpdaLicense,Registration,Grade,UdpaExpiryDate,Remarks,LeaveEntitlement,AirTicketEntitlementTotalMonth,
			HiredThrough)
			VALUES(@EmployeeId,@LeavePolicyId,@ContractPeriodYear,@LaborContract,@ContractIssueDate,@ContractExpiryDate,@CompanyID,@MotherTongueId,
			@MaritalStatusId,@ChildrenNo,@ReligionId,@PreviousCompany,@CountryId,@HomeAirportId,@CompanyEmailID,@EmailIDs,@EmployeeGroupId,@EmployeeSubGroup,
			@EmployeeOfTheMonth,@UpdaLicense,@Registration,@Grade,@UdpaExpiryDate,@Remarks,@LeaveEntitlement,@AirTicketEntitlementTotalMonth,@HiredThrough)
			END				
	ELSE
		BEGIN
			UPDATE EmployeeOtherDetails SET 
						
				LeavePolicyId=ISNULL(@LeavePolicyId,LeavePolicyId),
				ContractPeriodYear=ISNULL(@ContractPeriodYear,ContractPeriodYear),
				LaborContract=ISNULL(@LaborContract,LaborContract),
				ContractIssueDate=ISNULL(@ContractIssueDate,ContractIssueDate),
				ContractExpiryDate=ISNULL(@ContractExpiryDate,ContractExpiryDate),
				CompanyID=ISNULL(@CompanyID,CompanyID),
				MotherTongueId=ISNULL(@MotherTongueId,MotherTongueId),
				MaritalStatusId=ISNULL(@MaritalStatusId,MaritalStatusId),
				ChildrenNo=ISNULL(@ChildrenNo,ChildrenNo),
				ReligionId=ISNULL(@ReligionId,ReligionId),
				PreviousCompany=ISNULL(@PreviousCompany,PreviousCompany),
				CountryId=ISNULL(@CountryId,CountryId),
				HomeAirportId=ISNULL(@HomeAirportId,HomeAirportId),
				CompanyEmailID=ISNULL(@CompanyEmailID,CompanyEmailID),
				EmailIDs=ISNULL(@EmailIDs,EmailIDs),
				EmployeeGroupId=ISNULL(@EmployeeGroupId,EmployeeGroupId),
				EmployeeSubGroup=ISNULL(@EmployeeSubGroup,EmployeeSubGroup),
				EmployeeOfTheMonth=ISNULL(@EmployeeOfTheMonth,EmployeeOfTheMonth),
				UpdaLicense=ISNULL(@UpdaLicense,UpdaLicense),
				Registration=ISNULL(@Registration,Registration),
				Grade=ISNULL(@Grade,Grade),
				UdpaExpiryDate=ISNULL(@UdpaExpiryDate,UdpaExpiryDate),
				Remarks=ISNULL(@Remarks,Remarks),
				LeaveEntitlement=ISNULL(@LeaveEntitlement,LeaveEntitlement),
				AirTicketEntitlementTotalMonth=ISNULL(@AirTicketEntitlementTotalMonth,AirTicketEntitlementTotalMonth),
				HiredThrough=ISNULL(@HiredThrough,HiredThrough)
				WHERE EmployeeId=@employeeId
							
		END
END



GO
/****** Object:  StoredProcedure [dbo].[Employee_SaveBatch]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_SaveBatch]
	@EmployeeCode NVARCHAR(100),
	@EmployeePassword NVARCHAR(150),
	@PortalUserCode NVARCHAR(150),
	@PortalUserId UNIQUEIDENTIFIER,
	@Status NVARCHAR(50),
	@Project NVARCHAR(150),
	@EmployeeName NVARCHAR(150),
	@Department NVARCHAR(150),
	@Designation NVARCHAR(150),
	@MobileNo NVARCHAR(50),
	@Nationality NVARCHAR(150),
	@DateOfBirth datetime,
	@Gender NVARCHAR(50),
	@PassportNo NVARCHAR(150),
	@PassportIssueDate datetime,
	@PassportExpiryDate datetime,
	@QID NVARCHAR(150),
	@QIDExpiryDate datetime,
	@WorkingCompany NVARCHAR(150),
	@Sponsorship NVARCHAR(150),
	@VisaNo NVARCHAR(150),
	@VisaExpirayDate datetime,
	@WorkLocation NVARCHAR(150),
	@CompanyAccomodation  NVARCHAR(150),
	@HealthCardNo  NVARCHAR(150),
	@HealthCardExpiryDate  NVARCHAR(150),
	@Insurance  NVARCHAR(150),
	@InsuranceExpirayDate datetime,
	@FoodHandling NVARCHAR(150),
	@FoodhandlingIssueDate datetime,
	@FoodhandlingExpiryDate datetime,
	@LastWorkingDate datetime,
	@DateOfJoining datetime,
	@ActionAt DATETIME,
	@ActionById uniqueidentifier,
	@ReturnId INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @statusId INT
	IF @Status='active'
	BEGIN
	 SET @statusId=1
	END
	ELSE
	BEGIN
	 SET @statusId=2
	END
	
	DECLARE @departmentId INT,@designationId INT,@projectId INT,@NationalityId int,@GenderId int,@WorkLocationId INT,@WorkingCompanyId INT
	--SELECT @ReportingManagerId=Id FROM ControlPanelUser WHERE LoginId=@ReportingManagerCode
	--		SELECT @PortalUserId=Id FROM ControlPanelUser WHERE LoginId=@PortalUserCode
		SELECT TOP 1 @departmentId=Id FROM Department WHERE DepartmentName=@Department
		SELECT TOP 1 @designationId=Id FROM Designation WHERE Name=@Designation
		SELECT @projectId=Id FROM InputHelp WHERE Name=@Project  AND InputHelpTypeId=11
		SELECT @NationalityId=Id FROM InputHelp WHERE Name=@Nationality  AND InputHelpTypeId=1
		SELECT @GenderId=Id FROM InputHelp WHERE Name=@Gender  AND InputHelpTypeId=2
		SELECT @WorkLocationId=Id FROM InputHelp WHERE Name=@WorkLocation  AND InputHelpTypeId=5
		SELECT @WorkingCompanyId=Id FROM InputHelp WHERE Name=@WorkingCompany  AND InputHelpTypeId=3

	IF  NOT EXISTS  (SELECT * FROM Employee WHERE EmployeeCode=@EmployeeCode)
		BEGIN

		  INSERT INTO UserCredentials(Id,FullName,Email,ContactNo,LoginID,Password,UserTypeId,IsActive,CreatedAt,CompanyId)
		  VALUES(@PortalUserId,@EmployeeName,NULL,@MobileNo,@EmployeeCode,@EmployeePassword,5,1,@ActionAt,@WorkingCompanyId)


			INSERT INTO Employee(EmployeeCode,EmployeeName,DepartmentId,DesignationId,MobileNo,StatusId,
			ProjectId,NationalityId,DateOfBirth,GenderId,PassportNo,PassportIssueDate,PassportExpiryDate,
			QID,QIDExpiryDate,WorkingCompanyId,Sponsorship,VisaNo,VisaExpirayDate,WorkLocationId,CompanyAccomodation,HealthCardNo,
			HealthCardExpiryDate,Insurance,InsuranceExpirayDate,FoodHandling,FoodhandlingIssueDate,FoodhandlingExpiryDate,
			LastWorkingDate,DateOfJoining,CreatedAt,CreatedById,PortalUserId)
			VALUES(@EmployeeCode,@EmployeeName,@departmentId,@designationId,@MobileNo,@statusId,
			@projectId,@NationalityId,@DateOfBirth,@GenderId,@PassportNo,@PassportIssueDate,@PassportExpiryDate,
			@QID,@QIDExpiryDate,@WorkingCompanyId,@Sponsorship,@VisaNo,@VisaExpirayDate,@WorkLocationId,@CompanyAccomodation,@HealthCardNo,
			@HealthCardExpiryDate,@Insurance,@InsuranceExpirayDate,@FoodHandling,@FoodhandlingIssueDate,@FoodhandlingExpiryDate,
			@LastWorkingDate,@DateOfJoining,@ActionAt,@ActionById,@PortalUserId)
				SET @ReturnId=SCOPE_IDENTITY()
			END				
	ELSE
		BEGIN
			DECLARE @employeeId int
			SELECT TOP 1 @employeeId=T.Id FROM Employee T WHERE T.EmployeeCode=@EmployeeCode;
			IF @employeeId > 0
				BEGIN
					UPDATE Employee SET 
						
						EmployeeName=ISNULL(@EmployeeName,EmployeeName),
						DepartmentId=ISNULL(@departmentId,DepartmentId),
						DesignationId=ISNULL(@DesignationId,DesignationId),
						MobileNo=ISNULL(@MobileNo,MobileNo),
						StatusId=ISNULL(@statusId,StatusId),
						ProjectId=ISNULL(@ProjectId,ProjectId),
						NationalityId=ISNULL(@NationalityId,NationalityId),
						DateOfBirth=ISNULL(@DateOfBirth,DateOfBirth),
						GenderId=ISNULL(@GenderId,GenderId),
						PassportNo=ISNULL(@PassportNo,PassportNo),
						PassportIssueDate=ISNULL(@PassportIssueDate,PassportIssueDate),
						PassportExpiryDate=ISNULL(@PassportExpiryDate,PassportExpiryDate),
						QID=ISNULL(@QID,QID),
						QIDExpiryDate=ISNULL(@QIDExpiryDate,QIDExpiryDate),
						WorkingCompanyId=ISNULL(@WorkingCompanyId,WorkingCompanyId),
						Sponsorship=ISNULL(@Sponsorship,Sponsorship),
						VisaNo=ISNULL(@VisaNo,VisaNo),
						VisaExpirayDate=ISNULL(@VisaExpirayDate,VisaExpirayDate),
						WorkLocationId=ISNULL(@WorkLocationId,WorkLocationId),
						CompanyAccomodation=ISNULL(@CompanyAccomodation,CompanyAccomodation),
						HealthCardNo=ISNULL(@HealthCardNo,HealthCardNo),
						HealthCardExpiryDate=ISNULL(@HealthCardExpiryDate,HealthCardExpiryDate),
						Insurance=ISNULL(@Insurance,Insurance),
						InsuranceExpirayDate=ISNULL(@InsuranceExpirayDate,InsuranceExpirayDate),
						FoodHandling=ISNULL(@FoodHandling,FoodHandling),

						FoodhandlingIssueDate=ISNULL(@FoodhandlingIssueDate,FoodhandlingIssueDate),
						FoodhandlingExpiryDate=ISNULL(@FoodhandlingExpiryDate,FoodhandlingExpiryDate),
						LastWorkingDate=ISNULL(@LastWorkingDate,LastWorkingDate),
						DateOfJoining=ISNULL(@DateOfJoining,DateOfJoining),
						UpdatedAt=@ActionAt,
						UpdatedById=@ActionById
						
					WHERE Id=@employeeId
							
					SET @ReturnId=@employeeId
				END
		END	
END



GO
/****** Object:  StoredProcedure [dbo].[Employee_SaveOtherDetailsBatch]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_SaveOtherDetailsBatch]
	@EmployeeId BIGINT,
	@LeavePolicyCode NVARCHAR(50),
	@LeaveEntitlement INT,
	@AirTicketEntitlementTotalMonth int,
	@HiredThrough NVARCHAR(150),
	@ContractPeriodYear int,
	@LaborContract NVARCHAR(150),
	@ContractIssueDate datetime,
	@ContractExpiryDate datetime,
	@CompanyID NVARCHAR(150),
	@MotherTongue NVARCHAR(50),
	@MaritalStatus NVARCHAR(150),
	@ChildrenNo int,
	@Religion NVARCHAR(150),
	@PreviousCompany NVARCHAR(150),
	@Country NVARCHAR(150),
	@HomeAirport NVARCHAR(150),
	@CompanyEmailID NVARCHAR(150),
	@EmailIDs NVARCHAR(150),
	@EmployeeGroup  NVARCHAR(150),
	@EmployeeSubGroup  NVARCHAR(150),
	@EmployeeOfTheMonth  NVARCHAR(150),
	@UpdaLicense  NVARCHAR(150),
	@Registration NVARCHAR(150),
	@Grade NVARCHAR(150),
	@UdpaExpiryDate datetime,
	@Remarks NVARCHAR(350)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @LeavePolicyId INT,@MaritalStatusId INT,@ReligionId INT,@CountryId int

		SELECT TOP 1 @LeavePolicyId=Id FROM LeavePolicy WHERE PolicyCode=@LeavePolicyCode
		SELECT TOP 1 @MaritalStatusId=Id FROM InputHelp WHERE Name=@MaritalStatus  AND InputHelpTypeId=12
		SELECT TOP 1 @ReligionId=Id FROM InputHelp WHERE Name=@Religion  AND InputHelpTypeId=6
		SELECT TOP 1 @CountryId=Id FROM InputHelp WHERE Name=@Country  AND InputHelpTypeId=8
		

	IF  NOT EXISTS  (SELECT * FROM EmployeeOtherDetails WHERE EmployeeId=@EmployeeId)
		BEGIN

			INSERT INTO EmployeeOtherDetails(EmployeeId,LeavePolicyId,LeaveEntitlement,AirTicketEntitlementTotalMonth,HiredThrough,
			ContractPeriodYear,LaborContract,ContractIssueDate,ContractExpiryDate,CompanyID,MotherTongue,MaritalStatusId,
			ChildrenNo,ReligionId,PreviousCompany,CountryId,HomeAirport,CompanyEmailID,EmailIDs,EmployeeGroup,EmployeeSubGroup,
			EmployeeOfTheMonth,UpdaLicense,Registration,Grade,UdpaExpiryDate,Remarks)
			VALUES(@EmployeeId,@LeavePolicyId,@LeaveEntitlement,@AirTicketEntitlementTotalMonth,@HiredThrough,
			@ContractPeriodYear,@LaborContract,@ContractIssueDate,@ContractExpiryDate,@CompanyID,@MotherTongue,@MaritalStatusId,
			@ChildrenNo,@ReligionId,@PreviousCompany,@CountryId,@HomeAirport,@CompanyEmailID,@EmailIDs,@EmployeeGroup,@EmployeeSubGroup,
			@EmployeeOfTheMonth,@UpdaLicense,@Registration,@Grade,@UdpaExpiryDate,@Remarks)
			END				
	ELSE
		BEGIN
			UPDATE EmployeeOtherDetails SET 
						
				LeavePolicyId=ISNULL(@LeavePolicyId,LeavePolicyId),
				LeaveEntitlement=ISNULL(@LeaveEntitlement,LeaveEntitlement),
				AirTicketEntitlementTotalMonth=ISNULL(@AirTicketEntitlementTotalMonth,AirTicketEntitlementTotalMonth),
				HiredThrough=ISNULL(@HiredThrough,HiredThrough),
				ContractPeriodYear=ISNULL(@ContractPeriodYear,ContractPeriodYear),
				LaborContract=ISNULL(@LaborContract,LaborContract),
				ContractIssueDate=ISNULL(@ContractIssueDate,ContractIssueDate),
				ContractExpiryDate=ISNULL(@ContractExpiryDate,ContractExpiryDate),
				CompanyID=ISNULL(@CompanyID,CompanyID),
				MotherTongue=ISNULL(@MotherTongue,MotherTongue),
				MaritalStatusId=ISNULL(@MaritalStatusId,MaritalStatusId),
				ChildrenNo=ISNULL(@ChildrenNo,ChildrenNo),
				ReligionId=ISNULL(@ReligionId,ReligionId),
				PreviousCompany=ISNULL(@PreviousCompany,PreviousCompany),
				CountryId=ISNULL(@CountryId,CountryId),
				HomeAirport=ISNULL(@HomeAirport,HomeAirport),
				CompanyEmailID=ISNULL(@CompanyEmailID,CompanyEmailID),
				EmailIDs=ISNULL(@EmailIDs,EmailIDs),
				EmployeeGroup=ISNULL(@EmployeeGroup,EmployeeGroup),
				EmployeeSubGroup=ISNULL(@EmployeeSubGroup,EmployeeSubGroup),
				EmployeeOfTheMonth=ISNULL(@EmployeeOfTheMonth,EmployeeOfTheMonth),
				UpdaLicense=ISNULL(@UpdaLicense,UpdaLicense),
				Registration=ISNULL(@Registration,Registration),
				Grade=ISNULL(@Grade,Grade),
				UdpaExpiryDate=ISNULL(@UdpaExpiryDate,UdpaExpiryDate),

				Remarks=ISNULL(@Remarks,Remarks)
						
			WHERE EmployeeId=@employeeId
							
		END
END






GO
/****** Object:  StoredProcedure [dbo].[Employee_SaveSalaryStructureBatch]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Employee_SaveSalaryStructureBatch]
	@EmployeeId BIGINT,
	@BasicPay DECIMAL(18,2),
	@Housing DECIMAL(18,2),
	@Transport DECIMAL(18,2),
	@Telephone DECIMAL(18,2),
	@FoodAllowance DECIMAL(18,2),
	@OtherAllowancce DECIMAL(18,2),
	@TeamLeadAllowance DECIMAL(18,2),
	@CityCompensatoryAllowance DECIMAL(18,2),
	@PersonalAllowance DECIMAL(18,2),
	@OutsideAllowance DECIMAL(18,2),
	@NetSalary DECIMAL(18,2),
	@BankName NVARCHAR(150),
	@EmployeeAccount NVARCHAR(50),
	@SalaryCategory NVARCHAR(150)
AS
BEGIN
	SET NOCOUNT ON;
	
	IF  NOT EXISTS  (SELECT * FROM EmployeeSalaryStructure WHERE EmployeeId=@EmployeeId)
		BEGIN

			INSERT INTO EmployeeSalaryStructure(EmployeeId,BasicPay,Housing,Transport,Telephone,FoodAllowance,OtherAllowancce,
			TeamLeadAllowance,CityCompensatoryAllowance,PersonalAllowance,OutsideAllowance,NetSalary,BankName,EmployeeAccount,SalaryCategory)
			VALUES(@EmployeeId,@BasicPay,@Housing,@Transport,@Telephone,@FoodAllowance,@OtherAllowancce,
			@TeamLeadAllowance,@CityCompensatoryAllowance,@PersonalAllowance,@OutsideAllowance,@NetSalary,@BankName,@EmployeeAccount,@SalaryCategory)
			END				
	ELSE
		BEGIN
			UPDATE EmployeeSalaryStructure SET 
						
				BasicPay=@BasicPay,
				Housing=@Housing,
				Transport=@Transport,
				Telephone=@Telephone,
				FoodAllowance=@FoodAllowance,
				OtherAllowancce=@OtherAllowancce,
				TeamLeadAllowance=@TeamLeadAllowance,
				CityCompensatoryAllowance=@CityCompensatoryAllowance,
				PersonalAllowance=@PersonalAllowance,
				OutsideAllowance=@OutsideAllowance,
				NetSalary=@NetSalary,
				BankName=@BankName,
				EmployeeAccount=@EmployeeAccount,
				SalaryCategory=@SalaryCategory
				
			WHERE EmployeeId=@employeeId
		END
END







GO
/****** Object:  StoredProcedure [dbo].[UserCredential_Insert]    Script Date: 4/27/2022 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserCredential_Insert]
	@Id uniqueidentifier,
	@FullName NVARCHAR(350),
	@Email NVARCHAR(50),
	@LoginID NVARCHAR(50),
	@ContactNo NVARCHAR(50),
	@Password NVARCHAR(50),
	@UserTypeId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
   SET NOCOUNT ON;

   INSERT INTO dbo.UserCredentials(Id,FullName,Email,ContactNo,Password,UserTypeId,IsActive,CreatedAt,LoginID)
   VALUES(@Id,@FullName,@Email,@ContactNo,@Password,@UserTypeId,1,GETDATE(),@LoginID)
   
   
END
GO
USE [master]
GO
ALTER DATABASE [db_oas] SET  READ_WRITE 
GO
