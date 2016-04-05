SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[styles]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [styles](
		[style_name] [nvarchar](50) NULL,
		[style_transl] [nvarchar](50) NULL
	);
	INSERT INTO styles VALUES ('Compact',NULL);
	INSERT INTO styles VALUES ('Blueprint',NULL);
	INSERT INTO styles VALUES ('GreenApple',NULL);
	INSERT INTO styles VALUES ('Innovation',NULL);
	INSERT INTO styles VALUES ('Lollipop',NULL);
	INSERT INTO styles VALUES ('Simple',NULL);
	INSERT INTO styles VALUES ('Spring',NULL);
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[statuses]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [statuses](
		[status_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[status] [nvarchar](50) NULL
	);
	SET IDENTITY_INSERT statuses ON
	INSERT INTO statuses(status_id,status) VALUES (1,'res:im_status_open')
	INSERT INTO statuses(status_id,status) VALUES (2,'res:im_status_on_hold')
	INSERT INTO statuses(status_id,status) VALUES (3,'res:im_status_closed')
	INSERT INTO statuses(status_id,status) VALUES (4,'res:im_status_in_progress')
	INSERT INTO statuses(status_id,status) VALUES (5,'res:im_status_questions')
	INSERT INTO statuses(status_id,status) VALUES (6,'res:im_status_proposed')
	INSERT INTO statuses(status_id,status) VALUES (7,'res:im_status_compl_tested')
	INSERT INTO statuses(status_id,status) VALUES (8,'res:im_status_completed')
	SET IDENTITY_INSERT statuses OFF
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[settings]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [settings](
		[settings_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[file_extensions] [ntext] NULL,
		[file_path] [ntext] NULL,
		[notify_new_from] [nvarchar](50) NULL,
		[notify_new_subject] [ntext] NULL,
		[notify_new_body] [ntext] NULL,
		[notify_change_from] [nvarchar](50) NULL,
		[notify_change_subject] [ntext] NULL,
		[notify_change_body] [ntext] NULL,
		[upload_enabled] [nvarchar](1) NULL,
		[email_component] [smallint] NULL DEFAULT ((0)),
		[smtp_host] [nvarchar](100) NULL
	);
	SET IDENTITY_INSERT settings ON
	INSERT INTO settings([settings_id],[file_extensions],[file_path],[notify_new_from],[notify_new_subject],[notify_new_body],[notify_change_from],[notify_change_subject],[notify_change_body],[upload_enabled],[email_component],[smtp_host]) VALUES (1,'*.zip;*.pdf;*.doc;*.rtf;*.gif;*.jpg;*.png;*.txt;','uploads','admin@company.com','New Issue# {issue_no} was Submitted','hi {issue_receiver},\r\n<b>{issue_title}</b> was submitted {issue_url} by <b>{issue_poster}</b>','admin@company.com','Issue# {issue_no} was Changed','hi {issue_receiver},\r\n<b>{issue_title}</b> was changed {issue_url} by <b>{issue_poster}</b>','1',10,'');
	SET IDENTITY_INSERT settings OFF
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[responses]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [responses](
		[response_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[issue_id] [int] NULL DEFAULT ((0)),
		[response] [ntext] NULL,
		[user_id] [int] NULL DEFAULT ((0)),
		[priority_id] [int] NOT NULL DEFAULT ((0)),
		[status_id] [int] NOT NULL DEFAULT ((0)),
		[version] [nvarchar](10) NULL,
		[approved] [smallint] NULL DEFAULT ((0)),
		[tested] [smallint] NULL DEFAULT ((0)),
		[assigned_to] [int] NULL DEFAULT ((0)),
		[date_response] [datetime] NULL
	);
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[priorities]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [priorities](
		[priority_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[priority_desc] [nvarchar](50) NULL,
		[priority_order] [int] NULL DEFAULT ((0)),
		[priority_color] [nvarchar](30) NULL
	);
	SET IDENTITY_INSERT priorities ON
	INSERT INTO priorities(priority_id,priority_desc,priority_order,priority_color) VALUES (1,'res:im_priority_highest',10,'red')
	INSERT INTO priorities(priority_id,priority_desc,priority_order,priority_color) VALUES (2,'res:im_priority_high',20,'blue')
	INSERT INTO priorities(priority_id,priority_desc,priority_order,priority_color) VALUES (3,'res:im_priority_normal',30,NULL)
	INSERT INTO priorities(priority_id,priority_desc,priority_order,priority_color) VALUES (4,'res:im_priority_low',40,'#444444')
	INSERT INTO priorities(priority_id,priority_desc,priority_order,priority_color) VALUES (5,'res:im_priority_lowest',50,'#dddddd')
	SET IDENTITY_INSERT priorities OFF
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[locales]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [locales](
		[locale_name] [nvarchar](50) NULL
	)
	INSERT INTO locales VALUES ('en')
	INSERT INTO locales VALUES ('pl')
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[issues]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [issues](
		[issue_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[issue_name] [nvarchar](100) NULL,
		[issue_desc] [ntext] NULL,
		[user_id] [int] NULL DEFAULT ((0)),
		[priority_id] [int] NOT NULL DEFAULT ((0)),
		[status_id] [int] NOT NULL DEFAULT ((0)),
		[version] [nvarchar](10) NULL,
		[approved] [smallint] NULL DEFAULT ((0)),
		[tested] [smallint] NULL DEFAULT ((0)),
		[assigned_to] [int] NULL DEFAULT ((0)),
		[assigned_to_orig] [int] NULL DEFAULT ((0)),
		[date_submitted] [datetime] NULL,
		[date_resolved] [datetime] NULL,
		[date_modified] [datetime] NULL,
		[modified_by] [int] NULL DEFAULT ((0))
	);
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[files]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [files](
		[file_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[file_name] [nvarchar](100) NULL,
		[issue_id] [int] NULL DEFAULT ((0)),
		[date_uploaded] [datetime] NULL,
		[uploaded_by] [int] NULL DEFAULT ((0))
	);
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[email_components]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [email_components](
		[component_id] [int] NOT NULL DEFAULT ((0)) PRIMARY KEY,
		[component_name] [nvarchar](50) NULL
	);
	INSERT INTO email_components VALUES (0,'res:im_component_none')
	INSERT INTO email_components VALUES (1,'res:im_component_test')
	INSERT INTO email_components VALUES (9,'CDONTS/CDOSYS')
	INSERT INTO email_components VALUES (10,'System.Net.Mail')
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[config]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [config](
		[var] [nvarchar](100) NOT NULL PRIMARY KEY,
		[val] [nvarchar](255) NULL
	);
	INSERT INTO config VALUES('db_type', 'IM3')
	INSERT INTO config VALUES('db_version', '3.0.0')
END
GO


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[users]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [users](
		[user_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[user_name] [nvarchar](50) NULL,
		[login] [nvarchar](15) NULL,
		[pass] [nvarchar](15) NULL,
		[email] [nvarchar](50) NULL,
		[security_level] [smallint] NULL DEFAULT ((0)),
		[notify_new] [smallint] NULL DEFAULT ((0)),
		[notify_original] [smallint] NULL DEFAULT ((0)),
		[notify_reassignment] [smallint] NULL DEFAULT ((0)),
		[allow_upload] [smallint] NULL DEFAULT ((0))
	);
	SET IDENTITY_INSERT users ON
	INSERT INTO users([user_id],[user_name],[login],[pass],[email],[security_level],[notify_new],[notify_original],[notify_reassignment],[allow_upload]) VALUES (5,'Administrator','admin','admin','admin@company.com',3,0,0,0,1)
	SET IDENTITY_INSERT users OFF
END
GO
