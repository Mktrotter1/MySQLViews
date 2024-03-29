-- View: active_sku_view
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `active_sku_view` AS select `sku`.`id` AS `id`,concat(convert(`b`.`code` using utf8mb4),'-',convert(`s`.`id` using utf8mb4),'-',`c`.`code`,'-',`p`.`code`,'-',`ps`.`code`,(case when ((`sku`.`class` = 'Retail') or (`sku`.`class` is null)) then '' when (`sku`.`class` = 'Promo') then '(P)' when (`sku`.`class` = 'Sample') then '(S)' end)) AS `sku`,concat(convert(`b`.`name` using utf8mb4),' - ',convert((case when (`b`.`code` = 'PS') then `s`.`pacific_stone_label` when (`b`.`code` = 'TM') then `s`.`time_machine_label` end) using utf8mb4),' - ',`c`.`name`,' ',`p`.`name`,' (',`ps`.`name`,')',(case when ((`sku`.`class` = 'Retail') or (`sku`.`class` is null)) then '' when (`sku`.`class` = 'Promo') then ' (Promo)' when (`sku`.`class` = 'Sample') then ' (Sample)' end)) AS `name`,`sku`.`status` AS `status`,`b`.`code` AS `brand_code`,`b`.`name` AS `brand_name`,`c`.`code` AS `category_code`,`c`.`name` AS `category_name`,`p`.`code` AS `package_code`,`p`.`name` AS `package_name`,`ps`.`code` AS `package_size_code`,`ps`.`name` AS `package_size_name`,`s`.`id` AS `strain_code`,(case when (`b`.`code` = 'PS') then `s`.`pacific_stone_label` when (`b`.`code` = 'TM') then `s`.`time_machine_label` end) AS `strain_name`,`s`.`category` AS `strain_category`,`sku`.`kss_id` AS `kss_id`,`sku`.`class` AS `class` from (((((`sku` left join `pacstone`.`brand` `b` on((`sku`.`brand` = convert(`b`.`id` using utf8mb4)))) left join `category` `c` on((`sku`.`category` = `c`.`id`))) left join `package` `p` on((`sku`.`package` = `p`.`id`))) left join `package_size` `ps` on((`sku`.`package_size` = `ps`.`id`))) left join `pacstone`.`plant_strain` `s` on((`sku`.`plant_strain` = convert(`s`.`id` using utf8mb4)))) where (`sku`.`status` = 'Active');

-- View: kss_sku_view
CREATE ALGORITHM=UNDEFINED DEFINER=`mark`@`%` SQL SECURITY DEFINER VIEW `kss_sku_view` AS select `sku`.`kss_id` AS `kss_id`,`sku`.`id` AS `id`,concat(`b`.`code`,'-',`c`.`code`,'-',`ps`.`code`,'-',`p`.`code`,'-',`s`.`id`,(case when ((`sku`.`class` = 'Retail') or (`sku`.`class` is null)) then '' when (`sku`.`class` = 'Promo') then ' [xP]' when (`sku`.`class` = 'Sample') then ' [xT]' end),coalesce(`pg`.`code`,'')) AS `sku`,concat(`b`.`name`,' - ',`c`.`name`,' ',`p`.`name`,' [',`ps`.`code`,'] - ',(case when (`b`.`code` = 'PS') then `s`.`pacific_stone_label` when (`b`.`code` = 'TM') then `s`.`time_machine_label` end),(case when ((`sku`.`class` = 'Retail') or (`sku`.`class` is null)) then '' when (`sku`.`class` = 'Promo') then ' [xP]' when (`sku`.`class` = 'Sample') then ' [xT]' end),coalesce(`pg`.`name`,' ')) AS `name`,`sku`.`status` AS `status`,`b`.`code` AS `brand_code`,`b`.`name` AS `brand_name`,`c`.`code` AS `category_code`,`c`.`name` AS `category_name`,`p`.`code` AS `package_code`,`p`.`name` AS `package_name`,`pc`.`display_qty` AS `display_qty`,`ps`.`code` AS `package_size_code`,`ps`.`name` AS `package_size_name`,`sku`.`packing_group` AS `packing_group_id`,`pg`.`label` AS `packing_group_label`,`pg`.`quantity` AS `quantity`,`s`.`id` AS `strain_code`,(case when (`b`.`code` = 'PS') then `s`.`pacific_stone_label` when (`b`.`code` = 'TM') then `s`.`time_machine_label` end) AS `strain_name`,`s`.`category` AS `strain_category`,`sku`.`upc` AS `UPC`,`sku`.`class` AS `class`,`sku`.`source_sku` AS `source_sku` from (((((((`sku` left join `pacstone`.`brand` `b` on((`sku`.`brand` = `b`.`id`))) left join `category` `c` on((`sku`.`category` = `c`.`id`))) left join `package` `p` on((`sku`.`package` = `p`.`id`))) left join `package_size` `ps` on((`sku`.`package_size` = `ps`.`id`))) left join `pacstone`.`plant_strain` `s` on((`sku`.`plant_strain` = `s`.`id`))) left join `product_combination` `pc` on((`sku`.`product_combination` = `pc`.`id`))) left join `packing_group` `pg` on((`pg`.`id` = `sku`.`packing_group`)));

-- View: packing_sku_view
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `packing_sku_view` AS select `sku`.`id` AS `id`,concat(convert(`b`.`code` using utf8mb4),'-',convert(`s`.`id` using utf8mb4),'-',`c`.`code`,'-',`p`.`code`,'-',`ps`.`code`,(case when ((`sku`.`class` = 'Retail') or (`sku`.`class` is null)) then '' when (`sku`.`class` = 'Promo') then '(P)' when (`sku`.`class` = 'Sample') then '(S)' end)) AS `sku`,concat(convert(`b`.`name` using utf8mb4),' - ',convert((case when (`b`.`code` = 'PS') then `s`.`pacific_stone_label` when (`b`.`code` = 'TM') then `s`.`time_machine_label` end) using utf8mb4),' - ',`c`.`name`,' ',`p`.`name`,' (',`ps`.`name`,')',(case when ((`sku`.`class` = 'Retail') or (`sku`.`class` is null)) then '' when (`sku`.`class` = 'Promo') then ' (Promo)' when (`sku`.`class` = 'Sample') then ' (Sample)' end)) AS `name`,`sku`.`status` AS `status`,`b`.`id` AS `brand_id`,`b`.`code` AS `brand_code`,`b`.`name` AS `brand_name`,`c`.`id` AS `category_id`,`c`.`code` AS `category_code`,`c`.`name` AS `category_name`,`p`.`id` AS `package_id`,`p`.`code` AS `package_code`,`p`.`name` AS `package_name`,`ps`.`id` AS `package_size_id`,`ps`.`code` AS `package_size_code`,`ps`.`name` AS `package_size_name`,`sku`.`packing_group` AS `packing_group_id`,`pg`.`label` AS `packing_group_label`,`s`.`id` AS `strain_code`,(case when (`b`.`code` = 'PS') then `s`.`pacific_stone_label` when (`b`.`code` = 'TM') then `s`.`time_machine_label` end) AS `strain_name`,`s`.`category` AS `strain_category`,`sku`.`kss_id` AS `kss_id`,`sku`.`class` AS `class` from ((((((`sku` left join `pacstone`.`brand` `b` on((`sku`.`brand` = convert(`b`.`id` using utf8mb4)))) left join `category` `c` on((`sku`.`category` = `c`.`id`))) left join `package` `p` on((`sku`.`package` = `p`.`id`))) left join `package_size` `ps` on((`sku`.`package_size` = `ps`.`id`))) left join `packing_group` `pg` on((`sku`.`packing_group` = `pg`.`id`))) left join `pacstone`.`plant_strain` `s` on((`sku`.`plant_strain` = convert(`s`.`id` using utf8mb4)))) where ((`sku`.`status` = 'Active') and (`sku`.`class` = 'Retail'));

-- View: parent_sku
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `parent_sku` AS select `s`.`id` AS `id`,`sv`.`sku` AS `sku`,`sv`.`name` AS `name`,`s`.`kss_id` AS `kss_id` from ((`sku` `s` left join `packing_group` `pg` on((`pg`.`id` = `s`.`packing_group`))) left join `sku_view` `sv` on((`sv`.`id` = `s`.`id`))) where ((`pg`.`label` = 'each') and (`s`.`class` = 'retail'));

-- View: product_combination_view
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `product_combination_view` AS select `prod`.`id` AS `id`,`prod`.`brand` AS `brand`,`prod`.`category` AS `category`,`prod`.`category_type` AS `category_type`,`prod`.`package` AS `package`,`prod`.`package_size` AS `package_size`,`b`.`name` AS `brand_name`,`c`.`code` AS `category_code`,`c`.`name` AS `category_name`,`ct`.`name` AS `category_type_name`,`p`.`code` AS `package_code`,`p`.`name` AS `package_name`,`ps`.`code` AS `package_size_code`,`ps`.`name` AS `package_size_name`,`prod`.`status` AS `status` from (((((`product_combination` `prod` left join `category` `c` on((`prod`.`category` = `c`.`id`))) left join `pacstone`.`brand` `b` on((`prod`.`brand` = convert(`b`.`id` using utf8mb4)))) left join `category_type` `ct` on((`prod`.`category_type` = convert(`ct`.`id` using utf8mb4)))) left join `package` `p` on((`prod`.`package` = `p`.`id`))) left join `package_size` `ps` on((`prod`.`package_size` = `ps`.`id`)));

-- View: sku_detail
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `sku_detail` AS select concat(convert(`columns`.`table_alias` using utf8),'.',`columns`.`column_name`) AS `column_name` from (select 'ps' AS `table_alias`,`COLUMNS`.`COLUMN_NAME` AS `column_name` from `information_schema`.`COLUMNS` where ((`COLUMNS`.`TABLE_SCHEMA` = 'product_sku') and (`COLUMNS`.`TABLE_NAME` = 'sku')) union all select 'kss' AS `table_alias`,`COLUMNS`.`COLUMN_NAME` AS `column_name` from `information_schema`.`COLUMNS` where ((`COLUMNS`.`TABLE_SCHEMA` = 'sales') and (`COLUMNS`.`TABLE_NAME` = 'kss_sku'))) `columns`;

-- View: sku_pivot_view
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `sku_pivot_view` AS select `sv`.`strain_code` AS `strain_code`,`sv`.`brand_code` AS `brand_code`,max((case when (`sv`.`brand_code` = 'PS') then `ps`.`pacific_stone_label` when (`sv`.`brand_code` = 'TM') then `ps`.`time_machine_label` end)) AS `label`,max((case when ((`sv`.`category_name` = 'Flower') and (`sv`.`package_name` = 'Pouch') and (`sv`.`package_size_name` = '3.5 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Pouch 3.5g`,max((case when ((`sv`.`category_name` = 'Flower') and (`sv`.`package_name` = 'Pouch') and (`sv`.`package_size_name` = '7 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Pouch 7g`,max((case when ((`sv`.`category_name` = 'Flower') and (`sv`.`package_name` = 'Pouch') and (`sv`.`package_size_name` = '14 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Pouch 14g`,max((case when ((`sv`.`category_name` = 'Flower') and (`sv`.`package_name` = 'Pouch') and (`sv`.`package_size_name` = '28 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Pouch 28g`,max((case when ((`sv`.`category_name` = 'Pre-roll') and (`sv`.`package_name` = 'Tube') and (`sv`.`package_size_name` = '1 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Pre-roll 1g`,max((case when ((`sv`.`category_name` = 'Pre-roll') and (`sv`.`package_name` = 'Case') and (`sv`.`package_size_name` = '3.5 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Pre-roll 3.5g`,max((case when ((`sv`.`category_name` = 'Pre-roll') and (`sv`.`package_name` = 'Case') and (`sv`.`package_size_name` = '7 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Pre-roll 7g`,max((case when ((`sv`.`category_name` = 'Pre-roll') and (`sv`.`package_name` = 'Jar') and (`sv`.`package_size_name` = '14 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Pre-roll 14g`,max((case when ((`sv`.`category_name` = 'Flower') and (`sv`.`package_name` = 'Jar') and (`sv`.`package_size_name` = '3.5 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Flower Jar 3.5g`,max((case when ((`sv`.`category_name` = 'Flower') and (`sv`.`package_name` = 'Jar') and (`sv`.`package_size_name` = '7 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `Flower Jar 7g`,max((case when ((`sv`.`category_code` = 'RYO') and (`sv`.`package_name` = 'Pouch') and (`sv`.`package_size_name` = '14 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `RYO Pouch 14g`,max((case when ((`sv`.`category_code` = 'IPR') and (`sv`.`package_name` = 'Case') and (`sv`.`package_size_name` = '3.5 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `IPR Case 3.5g`,max((case when ((`sv`.`category_code` = 'CRS') and (`sv`.`package_name` = 'Cartridge') and (`sv`.`package_size_name` = '1 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `CRS Cartridge 1g`,max((case when ((`sv`.`category_code` = 'CRS') and (`sv`.`package_code` = 'DV') and (`sv`.`package_size_name` = '1 Grams')) then (case when (`sv`.`status` = 'Inactive') then '☐' when (`sv`.`status` = 'Active') then '✅' end) else NULL end)) AS `CRS DV 1g` from (`sku_view` `sv` left join `pacstone`.`plant_strain` `ps` on(((`ps`.`id` = `sv`.`strain_code`) and (`ps`.`status` = 'Active')))) group by `sv`.`strain_code`,`sv`.`brand_code` order by `sv`.`strain_code`;

-- View: sku_view
CREATE ALGORITHM=UNDEFINED DEFINER=`nieko`@`%` SQL SECURITY DEFINER VIEW `sku_view` AS select `sku`.`id` AS `id`,concat(`b`.`code`,'-',`c`.`code`,'-',`ps`.`code`,'-',`p`.`code`,'-',`s`.`id`,(case when ((`sku`.`class` = 'Retail') or (`sku`.`class` is null)) then '' when (`sku`.`class` = 'Promo') then ' [xP]' when (`sku`.`class` = 'Sample') then ' [xT]' end),coalesce(`pg`.`code`,'')) AS `sku`,`sku`.`kss_id` AS `kss_id`,concat(`b`.`name`,' - ',`c`.`name`,' ',`p`.`name`,' [',`ps`.`code`,'] - ',(case when (`b`.`code` = 'PS') then `s`.`pacific_stone_label` when (`b`.`code` = 'TM') then `s`.`time_machine_label` end),(case when ((`sku`.`class` = 'Retail') or (`sku`.`class` is null)) then '' when (`sku`.`class` = 'Promo') then ' [xP]' when (`sku`.`class` = 'Sample') then ' [xT]' end),coalesce(`pg`.`name`,' ')) AS `name`,`sku`.`status` AS `status`,`b`.`code` AS `brand_code`,`b`.`name` AS `brand_name`,`c`.`code` AS `category_code`,`c`.`name` AS `category_name`,`p`.`code` AS `package_code`,`p`.`name` AS `package_name`,`pc`.`id` AS `product_combination_code`,`pc`.`display_qty` AS `display_qty`,`ps`.`code` AS `package_size_code`,`ps`.`name` AS `package_size_name`,`sku`.`packing_group` AS `packing_group_id`,`pg`.`label` AS `packing_group_label`,`pg`.`quantity` AS `quantity`,`s`.`id` AS `strain_code`,(case when (`b`.`code` = 'PS') then `s`.`pacific_stone_label` when (`b`.`code` = 'TM') then `s`.`time_machine_label` end) AS `strain_name`,`s`.`category` AS `strain_category`,`sku`.`upc` AS `UPC`,`sku`.`class` AS `class`,`sku`.`source_sku` AS `source_sku` from (((((((`sku` left join `pacstone`.`brand` `b` on((`sku`.`brand` = `b`.`id`))) left join `category` `c` on((`sku`.`category` = `c`.`id`))) left join `package` `p` on((`sku`.`package` = `p`.`id`))) left join `package_size` `ps` on((`sku`.`package_size` = `ps`.`id`))) left join `pacstone`.`plant_strain` `s` on((`sku`.`plant_strain` = `s`.`id`))) left join `product_combination` `pc` on((`sku`.`product_combination` = `pc`.`id`))) left join `packing_group` `pg` on((`pg`.`id` = `sku`.`packing_group`)));

-- View: sku_view_temp
CREATE ALGORITHM=UNDEFINED DEFINER=`mark`@`%` SQL SECURITY DEFINER VIEW `sku_view_temp` AS select concat(`b`.`name`,' - ',`c`.`name`,' ',`p`.`name`,' - ',`ps`.`code`,' - ',(case when (`b`.`code` = 'PS') then `s`.`pacific_stone_label` when (`b`.`code` = 'TM') then `s`.`time_machine_label` end),(case when ((`sku`.`class` = 'Retail') or (`sku`.`class` is null)) then '' when (`sku`.`class` = 'Promo') then ' [xP]' when (`sku`.`class` = 'Sample') then ' [xT]' end),coalesce(`pg`.`name`,' ')) AS `SM_name`,`upc`.`SKU` AS `UPC_name`,concat(`kss`.`ProductName`,' - ',`kss`.`Package`) AS `KSS_name`,`sku`.`upc` AS `UPC`,`sku`.`kss_id` AS `kss_id`,`sku`.`id` AS `sku_id` from (((((((((`sku` left join `pacstone`.`brand` `b` on((`sku`.`brand` = `b`.`id`))) left join `category` `c` on((`sku`.`category` = `c`.`id`))) left join `package` `p` on((`sku`.`package` = `p`.`id`))) left join `package_size` `ps` on((`sku`.`package_size` = `ps`.`id`))) left join `pacstone`.`plant_strain` `s` on((`sku`.`plant_strain` = `s`.`id`))) left join `product_combination` `pc` on((`sku`.`product_combination` = `pc`.`id`))) left join `packing_group` `pg` on((`pg`.`id` = `sku`.`packing_group`))) left join `upc` on((`sku`.`upc` = `upc`.`upc_id`))) left join `sales`.`kss_sku` `kss` on((`sku`.`kss_id` = `kss`.`id`)));

-- View: sku_view_vs_upc
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `sku_view_vs_upc` AS select `sv`.`id` AS `id`,`sv`.`sku` AS `sku`,`sv`.`kss_id` AS `kss_id`,`sv`.`name` AS `name`,`sv`.`status` AS `status`,`sv`.`brand_code` AS `brand_code`,`sv`.`brand_name` AS `brand_name`,`sv`.`category_code` AS `category_code`,`sv`.`category_name` AS `category_name`,`sv`.`package_code` AS `package_code`,`sv`.`package_name` AS `package_name`,`sv`.`product_combination_code` AS `product_combination_code`,`sv`.`display_qty` AS `display_qty`,`sv`.`package_size_code` AS `package_size_code`,`sv`.`package_size_name` AS `package_size_name`,`sv`.`packing_group_id` AS `packing_group_id`,`sv`.`packing_group_label` AS `packing_group_label`,`sv`.`quantity` AS `quantity`,`sv`.`strain_code` AS `strain_code`,`sv`.`strain_name` AS `strain_name`,`sv`.`strain_category` AS `strain_category`,`sv`.`UPC` AS `UPC`,`sv`.`class` AS `class`,`sv`.`source_sku` AS `source_sku`,`u`.`Brand Name` AS `upc_BrandName`,`u`.`SKU` AS `upc_SKU`,`u`.`description` AS `upc_description`,`u`.`packaging_category` AS `upc_packaging_category`,`u`.`package_size` AS `upc_package_size` from (`sku_view` `sv` join `upc` `u` on((`u`.`upc_id` = `sv`.`UPC`)));

-- View: upc_misassigned
CREATE ALGORITHM=UNDEFINED DEFINER=`marc`@`%` SQL SECURITY DEFINER VIEW `upc_misassigned` AS select `u`.`id` AS `id`,`u`.`GS1 Company Prefix` AS `GS1 Company Prefix`,`u`.`GTIN-8` AS `GTIN-8`,`u`.`GTIN-12 (U.P.C.)` AS `GTIN-12 (U.P.C.)`,`u`.`GTIN-13 (EAN)` AS `GTIN-13 (EAN)`,`u`.`Product Industry` AS `Product Industry`,`u`.`Packaging Level` AS `Packaging Level`,`u`.`Brand Name` AS `Brand Name`,`u`.`SKU` AS `SKU`,`u`.`Last Modified Date` AS `Last Modified Date`,`u`.`Status Label` AS `Status Label`,`u`.`Is Variable` AS `Is Variable`,`u`.`Is Purchasable` AS `Is Purchasable`,`u`.`Brand 1 Language` AS `Brand 1 Language`,`u`.`Desc 1 Language` AS `Desc 1 Language`,`u`.`Height` AS `Height`,`u`.`Width` AS `Width`,`u`.`Depth` AS `Depth`,`u`.`Dimension Measure` AS `Dimension Measure`,`u`.`Gross Weight` AS `Gross Weight`,`u`.`Net Weight` AS `Net Weight`,`u`.`Weight Measure` AS `Weight Measure`,`u`.`Product Description-Short` AS `Product Description-Short`,`u`.`Label Description` AS `Label Description`,`u`.`Net Content 1 Count` AS `Net Content 1 Count`,`u`.`Net Content 1 Unit of Measure` AS `Net Content 1 Unit of Measure`,`u`.`Net Content 2 Count` AS `Net Content 2 Count`,`u`.`Net Content 2 Unit of Measure` AS `Net Content 2 Unit of Measure`,`u`.`Net Content 3 Count` AS `Net Content 3 Count`,`u`.`Net Content 3 Unit of Measure` AS `Net Content 3 Unit of Measure`,`u`.`Brand Name 2` AS `Brand Name 2`,`u`.`Brand 2 Language` AS `Brand 2 Language`,`u`.`Description 2` AS `Description 2`,`u`.`Desc 2 Language` AS `Desc 2 Language`,`u`.`Global Product Classification` AS `Global Product Classification`,`u`.`Image URL` AS `Image URL`,`u`.`Image URL Validation` AS `Image URL Validation`,`u`.`Target Markets` AS `Target Markets`,`u`.`sku_id` AS `sku_id`,`u`.`upc_check` AS `upc_check`,`u`.`upc_base` AS `upc_base`,`u`.`upc_id` AS `upc_id`,`u`.`description` AS `description`,`u`.`packaging_category` AS `packaging_category`,`u`.`package_size` AS `package_size`,`u`.`type` AS `type` from (`upc` `u` left join `sku` `s` on((`s`.`upc_base` = `u`.`id`))) where ((`u`.`upc_check` is not null) and (`u`.`upc_check` <> '') and (`s`.`id` is null));
