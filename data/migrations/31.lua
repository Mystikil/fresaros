function onUpdateDatabase()
	db.query("ALTER TABLE `players` ADD `huntingtasks` longblob DEFAULT NULL")
	return true
end
