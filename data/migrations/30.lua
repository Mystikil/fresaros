function onUpdateDatabase()
	print("> Updating database to version 31 (Dungeons)")
	db.query(
		[[CREATE TABLE IF NOT EXISTS `solo_runners` (
	`player_id` INT NOT NULL,
	`dungeon_id` SMALLINT NOT NULL,
	`difficulty` TINYINT NOT NULL,
	`time` MEDIUMINT UNSIGNED NOT NULL,
	FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE);]]
	)
	db.query(
		[[CREATE TABLE IF NOT EXISTS `group_runs` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`dungeon_id` SMALLINT NOT NULL,
	`difficulty` TINYINT NOT NULL,
	`time` MEDIUMINT UNSIGNED NOT NULL,
	PRIMARY KEY (`id`));]]
	)
	db.query(
		[[CREATE TABLE IF NOT EXISTS `group_runners`(
	`run_id` INT UNSIGNED NOT NULL,
	`player` VARCHAR(255) NOT NULL,
	FOREIGN KEY (`run_id`) REFERENCES `group_runs` (`id`) ON DELETE CASCADE);]]
	)
	return true
end
