/* Database export results for db smartcommunication */

/* Preserve session variables */
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS=0;

/* Export data */

/* Table structure for ApplicationAccessTypeEntity */
CREATE TABLE `ApplicationAccessTypeEntity` (
  `failedLoginAttempts` int(11) NOT NULL,
  `lastFailedLogin` datetime DEFAULT NULL,
  `lastSuccessfulLogin` datetime DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCA9E419117E4E590` (`id`),
  CONSTRAINT `FKCA9E419117E4E590` FOREIGN KEY (`id`) REFERENCES `RelationshipTypeEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table ApplicationAccessTypeEntity */

/* Table structure for ApplicationRealmTypeEntity */
CREATE TABLE `ApplicationRealmTypeEntity` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5529A05CA2EEE702` (`id`),
  CONSTRAINT `FK5529A05CA2EEE702` FOREIGN KEY (`id`) REFERENCES `PartitionTypeEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table ApplicationRealmTypeEntity */

/* Table structure for ApplicationTypeEntity */
CREATE TABLE `ApplicationTypeEntity` (
  `id` varchar(255) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `realm_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5548590DB81B4017` (`realm_id`),
  CONSTRAINT `FK5548590DB81B4017` FOREIGN KEY (`realm_id`) REFERENCES `RealmTypeEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table ApplicationTypeEntity */

/* Table structure for BP_CMPY */
CREATE TABLE `BP_CMPY` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `establishedsince` date DEFAULT NULL,
  `BP_MAIN` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BP_CMPY_1_idx` (`BP_MAIN`),
  CONSTRAINT `fk_BP_CMPY_1` FOREIGN KEY (`BP_MAIN`) REFERENCES `BP_Main` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/* data for Table BP_CMPY */
INSERT INTO `BP_CMPY` VALUES (1,"Contourdynamic","localhost:8080","2005-11-15",1);
INSERT INTO `BP_CMPY` VALUES (2,"CustomerDemo","localhost:8080","2007-11-08",2);

/* Table structure for BP_ContactAccount */
CREATE TABLE `BP_ContactAccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `AccountType` int(11) DEFAULT NULL,
  `AccountID` varchar(255) DEFAULT NULL,
  `Extensions` varchar(45) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BP_ContactAccount_1_idx` (`AccountType`),
  KEY `fk_BP_ContactAccount_2_idx` (`Status`),
  CONSTRAINT `fk_BP_ContactAccount_1` FOREIGN KEY (`AccountType`) REFERENCES `ContactAccountCode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BP_ContactAccount_2` FOREIGN KEY (`Status`) REFERENCES `StatusCode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table BP_ContactAccount */

/* Table structure for BP_INDV */
CREATE TABLE `BP_INDV` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BP_MAIN` int(11) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `title` int(11) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `ageyears` int(11) DEFAULT NULL,
  `months` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BP_INDV_1_idx` (`BP_MAIN`),
  KEY `fk_BP_INDV_2_idx` (`gender`),
  KEY `fk_BP_INDV_3_idx` (`title`),
  CONSTRAINT `fk_BP_INDV_1` FOREIGN KEY (`BP_MAIN`) REFERENCES `BP_Main` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BP_INDV_2` FOREIGN KEY (`gender`) REFERENCES `GenderCode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BP_INDV_3` FOREIGN KEY (`title`) REFERENCES `TitleCode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/* data for Table BP_INDV */
INSERT INTO `BP_INDV` VALUES (2,3,"Amir","Ali",1,"Waris","2015-11-05",29,8,1);

/* Table structure for BP_Main */
CREATE TABLE `BP_Main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `StatusCode` int(11) DEFAULT NULL,
  `BP_SYS_User` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BP_Main_2_idx` (`type`),
  KEY `fk_BP_Main_1_idx` (`StatusCode`),
  KEY `fk_BP_Main_3_idx` (`BP_SYS_User`),
  CONSTRAINT `fk_BP_Main_3` FOREIGN KEY (`BP_SYS_User`) REFERENCES `BP_SYS_USER` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BP_Main_1` FOREIGN KEY (`StatusCode`) REFERENCES `StatusCode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BP_Main_2` FOREIGN KEY (`type`) REFERENCES `BP_TYPE_CODE` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/* data for Table BP_Main */
INSERT INTO `BP_Main` VALUES (1,"Administrator",1,5,1);
INSERT INTO `BP_Main` VALUES (2,"Customer",1,5,2);
INSERT INTO `BP_Main` VALUES (3,"Consumer",2,5,3);

/* Table structure for BP_Roles */
CREATE TABLE `BP_Roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BP_MAIN` int(11) DEFAULT NULL,
  `Role` int(11) DEFAULT NULL,
  `StatusCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BP_Roles_1_idx` (`Role`),
  KEY `fk_BP_Roles_3_idx` (`BP_MAIN`),
  KEY `fk_BP_Roles_2_idx` (`StatusCode`),
  CONSTRAINT `fk_BP_Roles_1` FOREIGN KEY (`Role`) REFERENCES `ROLE_CODE` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BP_Roles_2` FOREIGN KEY (`StatusCode`) REFERENCES `StatusCode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BP_Roles_3` FOREIGN KEY (`BP_MAIN`) REFERENCES `BP_Main` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/* data for Table BP_Roles */
INSERT INTO `BP_Roles` VALUES (3,1,1,5);
INSERT INTO `BP_Roles` VALUES (4,2,2,5);
INSERT INTO `BP_Roles` VALUES (5,3,3,5);

/* Table structure for BP_SYS_USER */
CREATE TABLE `BP_SYS_USER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `StatusCode` int(11) DEFAULT NULL,
  `Realm` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BP_SYS_USER_1_idx` (`user`),
  KEY `fk_BP_SYS_USER_1_idx1` (`StatusCode`),
  KEY `fk_BP_SYS_USER_2_idx` (`Realm`),
  CONSTRAINT `fk_BP_SYS_USER_1` FOREIGN KEY (`StatusCode`) REFERENCES `StatusCode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BP_SYS_USER_2` FOREIGN KEY (`Realm`) REFERENCES `Realm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/* data for Table BP_SYS_USER */
INSERT INTO `BP_SYS_USER` VALUES (1,"b8fe533f-e670-411f-8421-f4b329049d97",5,1);
INSERT INTO `BP_SYS_USER` VALUES (2,"394c9b0d-e121-4ce0-b2d0-549d4950341c",5,2);
INSERT INTO `BP_SYS_USER` VALUES (3,"6013f42c-8817-461f-bda6-65f12911f6a4",5,2);

/* Table structure for BP_TYPE_CODE */
CREATE TABLE `BP_TYPE_CODE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/* data for Table BP_TYPE_CODE */
INSERT INTO `BP_TYPE_CODE` VALUES (1,"Individuals");
INSERT INTO `BP_TYPE_CODE` VALUES (2,"Company");

/* Table structure for ContactAccountCode */
CREATE TABLE `ContactAccountCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ContactAccountCodecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/* data for Table ContactAccountCode */
INSERT INTO `ContactAccountCode` VALUES (1,"Email");
INSERT INTO `ContactAccountCode` VALUES (2,"Gmail");
INSERT INTO `ContactAccountCode` VALUES (3,"Skype");
INSERT INTO `ContactAccountCode` VALUES (4,"Mobile");
INSERT INTO `ContactAccountCode` VALUES (5,"Landline");

/* Table structure for GenderCode */
CREATE TABLE `GenderCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/* data for Table GenderCode */
INSERT INTO `GenderCode` VALUES (1,"Male");
INSERT INTO `GenderCode` VALUES (2,"Female");

/* Table structure for GrantTypeEntity */
CREATE TABLE `GrantTypeEntity` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB0072DD917E4E590` (`id`),
  CONSTRAINT `FKB0072DD917E4E590` FOREIGN KEY (`id`) REFERENCES `RelationshipTypeEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table GrantTypeEntity */
INSERT INTO `GrantTypeEntity` VALUES ("4f27b728-2e76-470f-8247-d7fda3d82102");
INSERT INTO `GrantTypeEntity` VALUES ("569d93f8-4ea7-4a5c-aabe-32945e344277");
INSERT INTO `GrantTypeEntity` VALUES ("6e7743f5-b535-40ea-ab4e-683f7d56a8a1");

/* Table structure for GroupMembershipTypeEntity */
CREATE TABLE `GroupMembershipTypeEntity` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2282F13217E4E590` (`id`),
  CONSTRAINT `FK2282F13217E4E590` FOREIGN KEY (`id`) REFERENCES `RelationshipTypeEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table GroupMembershipTypeEntity */

/* Table structure for GroupTypeEntity */
CREATE TABLE `GroupTypeEntity` (
  `id` varchar(255) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `partition_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9D7A437C11A8880C` (`parent_id`),
  KEY `FK9D7A437CB0305877` (`partition_id`),
  CONSTRAINT `FK9D7A437C11A8880C` FOREIGN KEY (`parent_id`) REFERENCES `GroupTypeEntity` (`id`),
  CONSTRAINT `FK9D7A437CB0305877` FOREIGN KEY (`partition_id`) REFERENCES `PartitionTypeEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table GroupTypeEntity */

/* Table structure for PartitionTypeEntity */
CREATE TABLE `PartitionTypeEntity` (
  `id` varchar(255) NOT NULL,
  `configurationName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table PartitionTypeEntity */
INSERT INTO `PartitionTypeEntity` VALUES ("0be7a951-6fff-46f7-b80a-a11c1c575807","default","contourdynamics","org.contourdynamics.cms.idm.model.Realm");
INSERT INTO `PartitionTypeEntity` VALUES ("d1ad69ec-7fc0-465f-8e07-a144122bf246","default","contourdynamicscustomer","org.contourdynamics.cms.idm.model.Realm");

/* Table structure for PasswordCredentialTypeEntity */
CREATE TABLE `PasswordCredentialTypeEntity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `effectiveDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `passwordEncodedHash` varchar(255) DEFAULT NULL,
  `passwordSalt` varchar(255) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK23B1B6CF3173B06F` (`owner_id`),
  CONSTRAINT `FK23B1B6CF3173B06F` FOREIGN KEY (`owner_id`) REFERENCES `UserTypeEntity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/* data for Table PasswordCredentialTypeEntity */
INSERT INTO `PasswordCredentialTypeEntity` VALUES (4,"2015-11-30 23:49:21",NULL,"WzZg2YEoU+D/DhAFf7j1Rc4a89OaPazQDaboOdQYG7sHoGfAXnfvL7fH5UqEGkf6BIzk3QYJ6qDE\nE2CBx/MRIA==","-1631182874861671","org.picketlink.idm.credential.storage.EncodedPasswordStorage","b8fe533f-e670-411f-8421-f4b329049d97");
INSERT INTO `PasswordCredentialTypeEntity` VALUES (5,"2015-11-30 23:49:21",NULL,"0PJ7OahWa/CRQTfMWsGp3959J3BquZfD4MUZFdevVEyyr83mDhooWl3cLFkVzpdpj8oFvVVDrG7O\n1XXvkdyN/A==","2264050515657629069","org.picketlink.idm.credential.storage.EncodedPasswordStorage","394c9b0d-e121-4ce0-b2d0-549d4950341c");
INSERT INTO `PasswordCredentialTypeEntity` VALUES (6,"2015-11-30 23:49:21",NULL,"8cX2uTUjBFVC/1W7vVudYfZho6OmAdb5f2O+H/LGe5uCfTWhBzgxKTMbIbROEHtOKV4ikZYCIh4N\nQb7DBms5nA==","-3307748303059220016","org.picketlink.idm.credential.storage.EncodedPasswordStorage","6013f42c-8817-461f-bda6-65f12911f6a4");

/* Table structure for ROLE_CODE */
CREATE TABLE `ROLE_CODE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/* data for Table ROLE_CODE */
INSERT INTO `ROLE_CODE` VALUES (1,"Administrator");
INSERT INTO `ROLE_CODE` VALUES (2,"Customer");
INSERT INTO `ROLE_CODE` VALUES (3,"Consumer");
INSERT INTO `ROLE_CODE` VALUES (4,"Vendor");
INSERT INTO `ROLE_CODE` VALUES (5,"Contacts");

/* Table structure for Realm */
CREATE TABLE `Realm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `domain` varchar(45) DEFAULT NULL,
  `StatusCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Realm_1_idx` (`StatusCode`),
  CONSTRAINT `fk_Realm_1` FOREIGN KEY (`StatusCode`) REFERENCES `StatusCode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/* data for Table Realm */
INSERT INTO `Realm` VALUES (1,"Administrator","contourdynamics",2);
INSERT INTO `Realm` VALUES (2,"Democustomer","contourdynamicscustomer",2);

/* Table structure for RealmTypeEntity */
CREATE TABLE `RealmTypeEntity` (
  `enforceSSL` tinyint(1) NOT NULL,
  `numberFailedLoginAttempts` int(11) NOT NULL,
  `privateKey` text,
  `publickKey` text,
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF28D538CA2EEE702` (`id`),
  CONSTRAINT `FKF28D538CA2EEE702` FOREIGN KEY (`id`) REFERENCES `PartitionTypeEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table RealmTypeEntity */
INSERT INTO `RealmTypeEntity` VALUES (0,3,"0‚v\00\r	*†H†÷\r\0‚`0‚\\\0\0Ž¼ä£vRq’€¾G÷ü*¤OhwñªsûÎæ6[qÝn5¹D3þà4$^í½©ù<ôq.™ÿ\"ÔÇYbA÷ÌdC,H?¹±û›v¯¶ë\0¾@ú¿ähÝiïîáY†èœØ3Ã¬U\nî¿2¾ýü.—W)’£BƒM–9Ô`È—\"Ã\0€G^|J:¥±÷Iá\\,¸—éKŠ¾£‚ž·WA/\nE8*’K-ÂFd“¶í×ÒDvSsþå7Ô]\0½„ðÇeì_pÀQm¥©A@{z¡LÆdš·?güÂ2|qÏ¹=í¹5Ö*ËŒâ§•F~†£µ£à×4_×äoùcš8€ÁA\0Òh»á4¢nƒýs°†~©‹u’åÍ•ë1µªÕZ7^Vb‹¹rD¹:BD¡ÊAÞO\\š?ÂRÉ{Z“A\0­ªyÑFPa4bZÌS¥óà=¾åÆãÉÖÎ¥öãˆõ™ïË¶jf;2€OXFYl$+¶™]vCË²Ò‚Ô@/œ¿—€	í’°ËÎÂ{q÷/§Ô—n\'K‚¢ÐÍb­x£ ÙWX(Ÿ¡IV‹( ýÑqHÏ·ø½@šgž>/;K>”¡„•]\n\Z±Ë>Í<¦×áO“ì˜ýQ[³U_hùœÖ}âi#ð;À\n…\"LwEj¶1A\0€§BÿÐº²úÒÄìN4=	XæŒßLPdÁ“Vô‹ØS½/_ånŽ[.ÜÔÇýìñŽPïAßÜT\0”XÀ`>z","0Ÿ0\r	*†H†÷\r\0\00‰\0Ž¼ä£vRq’€¾G÷ü*¤OhwñªsûÎæ6[qÝn5¹D3þà4$^í½©ù<ôq.™ÿ\"ÔÇYbA÷ÌdC,H?¹±û›v¯¶ë\0¾@ú¿ähÝiïîáY†èœØ3Ã¬U\nî¿2¾ýü.—W)’£BƒM–9Ô`È—\"Ã\0","0be7a951-6fff-46f7-b80a-a11c1c575807");
INSERT INTO `RealmTypeEntity` VALUES (0,3,"0‚w\00\r	*†H†÷\r\0‚a0‚]\0\0ÆŒ’Ó\'yÂUUä5ØH–’ÐUxa…,Î¶·Ù#ðYÿœ3-,ö!ú˜8V¿üjŠugÇî§Û‘_udä6›Ï¯e;\\K\\b•ìòÏ<ÓzT˜9ÿc<‡X¶bçM0ý\\Â§|edìjj£u\\SŒ©IœÈøÈ~tR2;\0\0¿ôîŠ°w‡çðÊ/\"‹úD—{eöÑÉÐ5è?=Ø‚¼=m®hrh¤º+-ùâ+ë¹‡ØYI©íÄù–dé¡7¸2\0˜Øà¦TžK´?4‡5uSÁ	®llüØû\0ZJæ¶G  ˜•u4aÉÖ­ï\nú4Sµ>í£‰9A\0ýÑ“4iá]!$7)ù/•ú˜ýö¨o¶®BÖ°ág¨ß\Z|ÏOàÇ8RŽó“åjtSW	…0çŽ†ë\"ï{ˆõ_ßA\0ÈAf{G®ùXèBwÒr(Ž¨ßá\"³î•^ibŒTM§ò”Ä×ºFñpëÝ³Ð’ô”å!ü aÃ%:ûBm)êêÐ%@dªð}±çI<îm ›8ÞŒW›t˜Ì7Eh[Í«ÚÏHU-,{Öî¦#8\"³œ7<J$rÓë2™B@vhmOQ¸}I{³ø6Qbç¥£:`ÇË Ø·•ËæùiQ„§8ŒÎ¿‡ËN,4†âå\'Vs‹y]A\0¾y2`°&äÞ\n¸UØ¦tÓ†¨»a_0hDŠþ›?ðÇhÐI8¹zJÃù½¬7e—&Â1KYÂ_ÜÕù","0Ÿ0\r	*†H†÷\r\0\00‰\0ÆŒ’Ó\'yÂUUä5ØH–’ÐUxa…,Î¶·Ù#ðYÿœ3-,ö!ú˜8V¿üjŠugÇî§Û‘_udä6›Ï¯e;\\K\\b•ìòÏ<ÓzT˜9ÿc<‡X¶bçM0ý\\Â§|edìjj£u\\SŒ©IœÈøÈ~tR2;\0","d1ad69ec-7fc0-465f-8e07-a144122bf246");

/* Table structure for RelationshipIdentityTypeEntity */
CREATE TABLE `RelationshipIdentityTypeEntity` (
  `identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `descriptor` varchar(255) DEFAULT NULL,
  `identityType` varchar(255) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  KEY `FKCD8D23937B06769C` (`owner_id`),
  CONSTRAINT `FKCD8D23937B06769C` FOREIGN KEY (`owner_id`) REFERENCES `RelationshipTypeEntity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/* data for Table RelationshipIdentityTypeEntity */
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (5,"assignee","org.contourdynamics.cms.idm.model.User:0be7a951-6fff-46f7-b80a-a11c1c575807:b8fe533f-e670-411f-8421-f4b329049d97","569d93f8-4ea7-4a5c-aabe-32945e344277");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (6,"role","org.contourdynamics.cms.idm.model.Role:0be7a951-6fff-46f7-b80a-a11c1c575807:4c514da6-8e90-48ec-afa9-9719b82267fb","569d93f8-4ea7-4a5c-aabe-32945e344277");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (7,"assignee","org.contourdynamics.cms.idm.model.User:0be7a951-6fff-46f7-b80a-a11c1c575807:b8fe533f-e670-411f-8421-f4b329049d97","569d93f8-4ea7-4a5c-aabe-32945e344277");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (8,"role","org.contourdynamics.cms.idm.model.Role:0be7a951-6fff-46f7-b80a-a11c1c575807:4c514da6-8e90-48ec-afa9-9719b82267fb","569d93f8-4ea7-4a5c-aabe-32945e344277");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (9,"assignee","org.contourdynamics.cms.idm.model.User:d1ad69ec-7fc0-465f-8e07-a144122bf246:394c9b0d-e121-4ce0-b2d0-549d4950341c","4f27b728-2e76-470f-8247-d7fda3d82102");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (10,"role","org.contourdynamics.cms.idm.model.Role:0be7a951-6fff-46f7-b80a-a11c1c575807:bf8c9f3c-d4ed-4e6f-8e34-c889f24f71a3","4f27b728-2e76-470f-8247-d7fda3d82102");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (11,"assignee","org.contourdynamics.cms.idm.model.User:d1ad69ec-7fc0-465f-8e07-a144122bf246:394c9b0d-e121-4ce0-b2d0-549d4950341c","4f27b728-2e76-470f-8247-d7fda3d82102");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (12,"role","org.contourdynamics.cms.idm.model.Role:0be7a951-6fff-46f7-b80a-a11c1c575807:bf8c9f3c-d4ed-4e6f-8e34-c889f24f71a3","4f27b728-2e76-470f-8247-d7fda3d82102");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (13,"assignee","org.contourdynamics.cms.idm.model.User:d1ad69ec-7fc0-465f-8e07-a144122bf246:6013f42c-8817-461f-bda6-65f12911f6a4","6e7743f5-b535-40ea-ab4e-683f7d56a8a1");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (14,"role","org.contourdynamics.cms.idm.model.Role:0be7a951-6fff-46f7-b80a-a11c1c575807:0b68c943-690a-4678-8884-51a580e7a28a","6e7743f5-b535-40ea-ab4e-683f7d56a8a1");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (15,"assignee","org.contourdynamics.cms.idm.model.User:d1ad69ec-7fc0-465f-8e07-a144122bf246:6013f42c-8817-461f-bda6-65f12911f6a4","6e7743f5-b535-40ea-ab4e-683f7d56a8a1");
INSERT INTO `RelationshipIdentityTypeEntity` VALUES (16,"role","org.contourdynamics.cms.idm.model.Role:0be7a951-6fff-46f7-b80a-a11c1c575807:0b68c943-690a-4678-8884-51a580e7a28a","6e7743f5-b535-40ea-ab4e-683f7d56a8a1");

/* Table structure for RelationshipTypeEntity */
CREATE TABLE `RelationshipTypeEntity` (
  `id` varchar(255) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table RelationshipTypeEntity */
INSERT INTO `RelationshipTypeEntity` VALUES ("4f27b728-2e76-470f-8247-d7fda3d82102","org.contourdynamics.cms.idm.model.Grant");
INSERT INTO `RelationshipTypeEntity` VALUES ("569d93f8-4ea7-4a5c-aabe-32945e344277","org.contourdynamics.cms.idm.model.Grant");
INSERT INTO `RelationshipTypeEntity` VALUES ("6e7743f5-b535-40ea-ab4e-683f7d56a8a1","org.contourdynamics.cms.idm.model.Grant");

/* Table structure for RoleTypeEntity */
CREATE TABLE `RoleTypeEntity` (
  `id` varchar(255) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `partition_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCAD418F3B0305877` (`partition_id`),
  CONSTRAINT `FKCAD418F3B0305877` FOREIGN KEY (`partition_id`) REFERENCES `PartitionTypeEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table RoleTypeEntity */
INSERT INTO `RoleTypeEntity` VALUES ("0b68c943-690a-4678-8884-51a580e7a28a","2015-11-30 23:49:21",0,NULL,"org.contourdynamics.cms.idm.model.Role","Consumer","0be7a951-6fff-46f7-b80a-a11c1c575807");
INSERT INTO `RoleTypeEntity` VALUES ("33e3c755-6a8a-40fb-9d1b-19efb9b29489","2015-11-30 23:49:21",0,NULL,"org.contourdynamics.cms.idm.model.Role","Contacts","0be7a951-6fff-46f7-b80a-a11c1c575807");
INSERT INTO `RoleTypeEntity` VALUES ("4c514da6-8e90-48ec-afa9-9719b82267fb","2015-11-30 23:49:21",0,NULL,"org.contourdynamics.cms.idm.model.Role","Administrator","0be7a951-6fff-46f7-b80a-a11c1c575807");
INSERT INTO `RoleTypeEntity` VALUES ("6ff8fce9-c8d1-46c9-87d9-e18760da7f99","2015-11-30 23:49:21",0,NULL,"org.contourdynamics.cms.idm.model.Role","Vendor","0be7a951-6fff-46f7-b80a-a11c1c575807");
INSERT INTO `RoleTypeEntity` VALUES ("bf8c9f3c-d4ed-4e6f-8e34-c889f24f71a3","2015-11-30 23:49:21",0,NULL,"org.contourdynamics.cms.idm.model.Role","Customer","0be7a951-6fff-46f7-b80a-a11c1c575807");

/* Table structure for StatusCode */
CREATE TABLE `StatusCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/* data for Table StatusCode */
INSERT INTO `StatusCode` VALUES (1,"Available");
INSERT INTO `StatusCode` VALUES (2,"Booked");
INSERT INTO `StatusCode` VALUES (3,"Current");
INSERT INTO `StatusCode` VALUES (4,"Previous");
INSERT INTO `StatusCode` VALUES (5,"Active");
INSERT INTO `StatusCode` VALUES (6,"InActive");
INSERT INTO `StatusCode` VALUES (7,"Blocked");

/* Table structure for TitleCode */
CREATE TABLE `TitleCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/* data for Table TitleCode */
INSERT INTO `TitleCode` VALUES (1,"Mr.");
INSERT INTO `TitleCode` VALUES (2,"Mrs.");
INSERT INTO `TitleCode` VALUES (3,"dr.");
INSERT INTO `TitleCode` VALUES (4,"sir.");
INSERT INTO `TitleCode` VALUES (5,"Miss.");

/* Table structure for UserTypeEntity */
CREATE TABLE `UserTypeEntity` (
  `id` varchar(255) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `realm_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK843B1E08B81B4017` (`realm_id`),
  CONSTRAINT `FK843B1E08B81B4017` FOREIGN KEY (`realm_id`) REFERENCES `RealmTypeEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* data for Table UserTypeEntity */
INSERT INTO `UserTypeEntity` VALUES ("394c9b0d-e121-4ce0-b2d0-549d4950341c","2015-11-30 23:49:21",0,NULL,"org.contourdynamics.cms.idm.model.User","customer","d1ad69ec-7fc0-465f-8e07-a144122bf246");
INSERT INTO `UserTypeEntity` VALUES ("6013f42c-8817-461f-bda6-65f12911f6a4","2015-11-30 23:49:21",0,NULL,"org.contourdynamics.cms.idm.model.User","consumer","d1ad69ec-7fc0-465f-8e07-a144122bf246");
INSERT INTO `UserTypeEntity` VALUES ("b8fe533f-e670-411f-8421-f4b329049d97","2015-11-30 23:49:21",0,NULL,"org.contourdynamics.cms.idm.model.User","admin","0be7a951-6fff-46f7-b80a-a11c1c575807");

/* Restore session variables to original values */
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
