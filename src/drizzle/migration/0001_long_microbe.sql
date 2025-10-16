CREATE TABLE `session` (
	`id` varchar(255) NOT NULL,
	`userid` int NOT NULL,
	`user_agent` text NOT NULL,
	`ip` varchar(255) NOT NULL,
	`expires_at` timestamp NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `session_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `username` varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE `users` ADD `role` enum('admin','applicant','employer') DEFAULT 'applicant';--> statement-breakpoint
ALTER TABLE `session` ADD CONSTRAINT `session_userid_users_id_fk` FOREIGN KEY (`userid`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;