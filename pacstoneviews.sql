-- View: active_cannabis_license
CREATE ALGORITHM=UNDEFINED DEFINER=`lizeth`@`%` SQL SECURITY DEFINER VIEW `active_cannabis_license` AS select `cl`.`id` AS `id`,`cl`.`property` AS `property`,`cl`.`type` AS `type`,`cl`.`short_number` AS `short_number`,`cl`.`business_entity` AS `business_entity` from `cannabis_license` `cl` where (`cl`.`status` = 'Active');

-- View: active_canopy
CREATE ALGORITHM=UNDEFINED DEFINER=`lizeth`@`%` SQL SECURITY DEFINER VIEW `active_canopy` AS select `c`.`id` AS `id`,`c`.`name` AS `name`,`c`.`property_id` AS `property_id`,`c`.`cannabis_license_id` AS `cannabis_license_id`,`c`.`metrc_initial` AS `metrc_package_tag_initial`,`c`.`metrc_plant_tag_initial` AS `metrc_plant_tag_initial`,`c`.`location_id` AS `location_id`,`c`.`location_string` AS `location_string`,`c`.`capacity` AS `capacity` from `canopy` `c` where (`c`.`status` = 'Active');

-- View: active_location
CREATE ALGORITHM=UNDEFINED DEFINER=`lizeth`@`%` SQL SECURITY DEFINER VIEW `active_location` AS select `l`.`id` AS `id`,`l`.`location_level1` AS `location_level1`,`l`.`location_level3` AS `location_level3`,`l`.`location_level5` AS `location_level5`,`l`.`location_string` AS `location_string`,`l`.`location_class` AS `location_class` from `location` `l` where (`l`.`status` = 'active');

-- View: active_property
CREATE ALGORITHM=UNDEFINED DEFINER=`lizeth`@`%` SQL SECURITY DEFINER VIEW `active_property` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`operations` AS `operations` from `property` `p` where ((`p`.`status` = 'Active') and (`p`.`operations` is not null));

-- View: active_strain
CREATE ALGORITHM=UNDEFINED DEFINER=`lizeth`@`%` SQL SECURITY DEFINER VIEW `active_strain` AS select `ps`.`id` AS `id`,`ps`.`name` AS `name`,`ps`.`category` AS `category` from `plant_strain` `ps` where (`ps`.`status` = 'Active');

-- View: app_temp
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `app_temp` AS select `a`.`id` AS `id`,`a`.`stage` AS `stage`,`a`.`process` AS `process`,`a`.`category` AS `category`,`a`.`public_name` AS `public_name`,`a`.`app_name` AS `app_name`,`a`.`app_id` AS `app_id`,`a`.`logo` AS `logo`,`a`.`note` AS `note`,`a`.`note_doc` AS `note_doc`,`a`.`gdrive_folder` AS `gdrive_folder`,`a`.`pm_link` AS `pm_link`,`a`.`sheet1` AS `sheet1`,`a`.`sheet2` AS `sheet2`,`a`.`sheet3` AS `sheet3`,`a`.`sheet4` AS `sheet4`,`a`.`sheet5` AS `sheet5`,`a`.`status` AS `status`,`a`.`trigger` AS `trigger`,`a`.`gsheets` AS `gsheets`,`a`.`gsheethelp` AS `gsheethelp`,`a`.`appnamehelp` AS `appnamehelp`,`a`.`appnameimage` AS `appnameimage`,`a`.`appidhelp` AS `appidhelp`,`a`.`appidhelpimage` AS `appidhelpimage`,`a`.`savedlogos` AS `savedlogos`,`a`.`savedlogolinks` AS `savedlogolinks`,`a`.`gds_url` AS `gds_url`,`a`.`1` AS `1`,`a`.`2` AS `2`,`a`.`is_dev_only` AS `is_dev_only`,`a`.`version` AS `version`,`a`.`row_select_behavior` AS `row_select_behavior`,`a`.`created_on` AS `created_on`,`a`.`created_by` AS `created_by`,`a`.`modified_on` AS `modified_on`,`a`.`modified_by` AS `modified_by`,`a`.`starting_view` AS `starting_view`,`a`.`parent_app` AS `parent_app`,`a`.`launch_variable1` AS `launch_variable1` from `application` `a`;

-- View: assigned_role_app_variables
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `assigned_role_app_variables` AS select `assigned_role`.`id` AS `id`,`assigned_role`.`app_name` AS `app_name`,`assigned_role`.`account` AS `account`,`assigned_role`.`variable1` AS `variable1`,`assigned_role`.`for_all_apps` AS `for_all_apps` from `assigned_role`;

-- View: assigned_role_ro
CREATE ALGORITHM=UNDEFINED DEFINER=`appsheet`@`%` SQL SECURITY DEFINER VIEW `assigned_role_ro` AS select `assigned_role`.`id` AS `id`,`assigned_role`.`account` AS `account`,`assigned_role`.`app_name` AS `app_name`,`assigned_role`.`role` AS `role` from `assigned_role`;

-- View: brand_strain
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `brand_strain` AS select concat('BD-001-',`plant_strain`.`id`) AS `id`,'BD-001' AS `brand`,'PS' AS `brand_code`,'Pacific Stone' AS `brand_name`,`plant_strain`.`id` AS `plant_strain`,`plant_strain`.`pacific_stone_label` AS `plant_strain_name` from `plant_strain` where ((`plant_strain`.`pacific_stone_label` is not null) and (`plant_strain`.`status` = 'Active')) union select concat('BD-002-',`plant_strain`.`id`) AS `id`,'BD-002' AS `brand`,'TM' AS `brand_code`,'Time Machine' AS `brand_name`,`plant_strain`.`id` AS `plant_strain`,`plant_strain`.`time_machine_label` AS `plant_strain_name` from `plant_strain` where ((`plant_strain`.`time_machine_label` is not null) and (`plant_strain`.`status` = 'Active'));

-- View: db_processlist
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `db_processlist` AS select `information_schema`.`PROCESSLIST`.`ID` AS `ID`,`information_schema`.`PROCESSLIST`.`USER` AS `USER`,`information_schema`.`PROCESSLIST`.`HOST` AS `HOST`,`information_schema`.`PROCESSLIST`.`DB` AS `DB`,`information_schema`.`PROCESSLIST`.`COMMAND` AS `COMMAND`,`information_schema`.`PROCESSLIST`.`TIME` AS `TIME`,`information_schema`.`PROCESSLIST`.`STATE` AS `STATE`,`information_schema`.`PROCESSLIST`.`INFO` AS `INFO` from `information_schema`.`PROCESSLIST` where (`information_schema`.`PROCESSLIST`.`COMMAND` <> 'Sleep') order by `information_schema`.`PROCESSLIST`.`TIME` desc;

-- View: employee_primary_property
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `employee_primary_property` AS select distinct `employee`.`primary_property` AS `primary_property` from `employee`;

-- View: license_entity
CREATE ALGORITHM=UNDEFINED DEFINER=`lizeth`@`%` SQL SECURITY DEFINER VIEW `license_entity` AS select `al`.`id` AS `id`,`al`.`property` AS `property`,`al`.`type` AS `type`,`al`.`short_number` AS `short_number`,`al`.`business_entity` AS `business_entity`,`be`.`name` AS `name` from (`active_cannabis_license` `al` left join `business_entity` `be` on((`be`.`id` = `al`.`business_entity`)));

-- View: paychex_org
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `paychex_org` AS select `o`.`name` AS `id`,`o`.`name` AS `name`,`o2`.`name` AS `parent` from (`utility`.`paychex_organization` `o` join `utility`.`paychex_organization` `o2` on((`o2`.`id` = `o`.`parent`)));

