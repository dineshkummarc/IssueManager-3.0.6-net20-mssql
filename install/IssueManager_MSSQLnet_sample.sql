SET IDENTITY_INSERT issues ON
GO
DELETE FROM issues
GO
INSERT INTO issues([issue_id],[issue_name],[issue_desc],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[assigned_to_orig],[date_submitted],[date_resolved],[date_modified],[modified_by]) VALUES (73,'User registration not accepting email','System doesn''t accept emails with multiple periods. For example dpincus@agx.usu.edu or d.pincus@yahoo.com\r\n',6,1,2,'1.0',1,1,6,6,'2001-11-01 00:00:00',NULL,'2001-08-27 21:59:35',6)
INSERT INTO issues([issue_id],[issue_name],[issue_desc],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[assigned_to_orig],[date_submitted],[date_resolved],[date_modified],[modified_by]) VALUES (74,'FTP publishing doesn''t work','While trying to publish via FTP on LAN got an error: "No PORT command issued"\r\nThe directory structure was created successfully but without any contents.\r\nCommand line Ftp works, indiciating that file permissions are set up correctly.',22,2,2,'0.968',0,1,22,20,'2001-08-27 22:05:20','2001-08-27 22:44:23','2001-09-24 12:39:00',23)
INSERT INTO issues([issue_id],[issue_name],[issue_desc],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[assigned_to_orig],[date_submitted],[date_resolved],[date_modified],[modified_by]) VALUES (75,'Server shuts down unexpectedly','User claims that his server shuts down unexpectedly since he installed the application.\r\nCase #596946 in the Support System.\r\nCan we recommend anything ?',22,3,1,NULL,0,0,21,21,'2001-08-27 22:09:50',NULL,'2001-08-27 22:09:50',0)
INSERT INTO issues([issue_id],[issue_name],[issue_desc],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[assigned_to_orig],[date_submitted],[date_resolved],[date_modified],[modified_by]) VALUES (76,'CTL+S doesn''t save projects','CTL+S doesn''t save projects in some sections of the program, particularly in the Modules and Styles sections.\r\nSelecting File / Save from the menu works well.',22,4,8,'0.965',0,0,7,6,'2001-08-27 22:32:10',NULL,'2001-08-27 22:38:40',22)
INSERT INTO issues([issue_id],[issue_name],[issue_desc],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[assigned_to_orig],[date_submitted],[date_resolved],[date_modified],[modified_by]) VALUES (77,'Database fields not visible','Database fields not visible in field drop-downs on forms. I am suspecting outdated MDAC drivers. Please confirm and check if there is another solution besides including latest MDAC in the installation.',22,1,4,'1.2',1,0,21,20,'2001-08-27 22:37:05',NULL,'2004-04-05 17:40:15',5)
GO
SET IDENTITY_INSERT issues OFF
GO
SET IDENTITY_INSERT responses ON
DELETE FROM responses
GO
INSERT INTO responses([response_id],[issue_id],[response],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[date_response]) VALUES (61,76,'This was fixed. Needs testing in version 0.965',22,4,8,'0.965',0,0,7,'2001-08-27 22:38:40')
INSERT INTO responses([response_id],[issue_id],[response],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[date_response]) VALUES (62,74,'This was fixed in the latest version 0.968',20,2,3,'0.968',0,1,20,'2001-08-27 22:44:23')
INSERT INTO responses([response_id],[issue_id],[response],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[date_response]) VALUES (63,77,'MDAC 2.5 and 2.6 solves this issue. I propose including MDAC 2.6 in the installation, unless we need to minimize file size.',20,1,6,NULL,0,0,22,'2001-08-27 23:14:51')
INSERT INTO responses([response_id],[issue_id],[response],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[date_response]) VALUES (64,77,'Plase include MDAC 2.6 in the new installation.',22,1,1,NULL,1,0,21,'2001-08-27 23:15:36')
INSERT INTO responses([response_id],[issue_id],[response],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[date_response]) VALUES (65,77,'I''m still working.',7,1,4,'1.2',1,0,21,'2001-08-30 11:46:30')
INSERT INTO responses([response_id],[issue_id],[response],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[date_response]) VALUES (66,74,'one more test',23,2,2,'0.968',0,1,22,NULL)
INSERT INTO responses([response_id],[issue_id],[response],[user_id],[priority_id],[status_id],[version],[approved],[tested],[assigned_to],[date_response]) VALUES (68,74,'this is the last issue',23,2,2,'0.968',0,1,23,'2001-09-24 12:36:00')
GO
SET IDENTITY_INSERT responses OFF
GO
SET IDENTITY_INSERT users ON
GO
INSERT INTO users([user_id],[user_name],[login],[pass],[email],[security_level],[notify_new],[notify_original],[notify_reassignment],[allow_upload]) VALUES (6,'Janet Cooper','janet','janet','janet@company.com',1,1,1,1,1)
INSERT INTO users([user_id],[user_name],[login],[pass],[email],[security_level],[notify_new],[notify_original],[notify_reassignment],[allow_upload]) VALUES (7,'Suzanne McCabe','suzie','suzie','suzanne@company.com',1,1,1,1,0)
INSERT INTO users([user_id],[user_name],[login],[pass],[email],[security_level],[notify_new],[notify_original],[notify_reassignment],[allow_upload]) VALUES (20,'Jim Morton','jim','jim','jim@company.com',2,1,1,1,0)
INSERT INTO users([user_id],[user_name],[login],[pass],[email],[security_level],[notify_new],[notify_original],[notify_reassignment],[allow_upload]) VALUES (21,'Tom Lincoln','tom','tom','tom@company.com',2,1,1,1,1)
INSERT INTO users([user_id],[user_name],[login],[pass],[email],[security_level],[notify_new],[notify_original],[notify_reassignment],[allow_upload]) VALUES (22,'Donald Pincus','don','don','donald@company.com',2,1,1,1,0)
INSERT INTO users([user_id],[user_name],[login],[pass],[email],[security_level],[notify_new],[notify_original],[notify_reassignment],[allow_upload]) VALUES (23,'Guest','guest','guest','guest@company.com',1,1,1,1,1)
GO
SET IDENTITY_INSERT users OFF
GO
