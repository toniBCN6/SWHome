-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         PostgreSQL 15.2, compiled by Visual C++ build 1914, 64-bit
-- SO del servidor:              
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla public.accesibilidad
CREATE TABLE IF NOT EXISTS "accesibilidad" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''accesibilidad_id_accesibilidad_seq''::regclass)',
	"reconocimiento_voz" BOOLEAN NULL DEFAULT NULL,
	"telefono_visual" BOOLEAN NULL DEFAULT NULL,
	"interfaz_inal" BOOLEAN NULL DEFAULT NULL,
	"equipo_iris" BOOLEAN NULL DEFAULT NULL,
	"view_count" BIGINT NULL DEFAULT NULL,
	"num_contrato" BIGINT NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "acces_fk" FOREIGN KEY ("num_contrato") REFERENCES "hogar" ("num_contrato") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Volcando datos para la tabla public.accesibilidad: 1 rows
/*!40000 ALTER TABLE "accesibilidad" DISABLE KEYS */;
INSERT IGNORE INTO "accesibilidad" ("id", "reconocimiento_voz", "telefono_visual", "interfaz_inal", "equipo_iris", "view_count", "num_contrato") VALUES
	(1, 'true', 'true', 'true', 'true', 0, NULL);
/*!40000 ALTER TABLE "accesibilidad" ENABLE KEYS */;

-- Volcando estructura para tabla public.energia
CREATE TABLE IF NOT EXISTS "energia" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''energia_id_energia_seq''::regclass)',
	"num_contrato" INTEGER NOT NULL,
	"control_del_clima" BOOLEAN NULL DEFAULT NULL,
	"agua_caliente" BOOLEAN NULL DEFAULT NULL,
	"riego" BOOLEAN NULL DEFAULT NULL,
	"electrodomesticos" BOOLEAN NULL DEFAULT NULL,
	"sensor_de_movimiento" BOOLEAN NULL DEFAULT NULL,
	"control_de_luz" BOOLEAN NULL DEFAULT NULL,
	"persianas" BOOLEAN NULL DEFAULT NULL,
	"gestion_de_tarifas" BOOLEAN NULL DEFAULT NULL,
	"view_count" BIGINT NULL DEFAULT NULL,
	"consumo_total" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_hogar" FOREIGN KEY ("num_contrato") REFERENCES "hogar" ("num_contrato") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Volcando datos para la tabla public.energia: 1 rows
/*!40000 ALTER TABLE "energia" DISABLE KEYS */;
INSERT IGNORE INTO "energia" ("id", "num_contrato", "control_del_clima", "agua_caliente", "riego", "electrodomesticos", "sensor_de_movimiento", "control_de_luz", "persianas", "gestion_de_tarifas", "view_count", "consumo_total") VALUES
	(1, 1, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 0, '277.40 kWh');
/*!40000 ALTER TABLE "energia" ENABLE KEYS */;

-- Volcando estructura para tabla public.failed_jobs
CREATE TABLE IF NOT EXISTS "failed_jobs" (
	"id" BIGINT NOT NULL DEFAULT 'nextval(''failed_jobs_id_seq''::regclass)',
	"connection" TEXT NOT NULL,
	"queue" TEXT NOT NULL,
	"payload" TEXT NOT NULL,
	"exception" TEXT NOT NULL,
	"failed_at" TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	PRIMARY KEY ("id")
);

-- Volcando datos para la tabla public.failed_jobs: 0 rows
/*!40000 ALTER TABLE "failed_jobs" DISABLE KEYS */;
/*!40000 ALTER TABLE "failed_jobs" ENABLE KEYS */;

-- Volcando estructura para tabla public.hogar
CREATE TABLE IF NOT EXISTS "hogar" (
	"num_contrato" INTEGER NOT NULL,
	"direccion" TEXT NULL DEFAULT NULL,
	"telefono" INTEGER NULL DEFAULT NULL,
	"poblacion" TEXT NULL DEFAULT NULL,
	"localidad" TEXT NULL DEFAULT NULL,
	"email" TEXT NULL DEFAULT NULL,
	"dni" TEXT NULL DEFAULT NULL,
	"titular" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("num_contrato")
);

-- Volcando datos para la tabla public.hogar: 1 rows
/*!40000 ALTER TABLE "hogar" DISABLE KEYS */;
INSERT IGNORE INTO "hogar" ("num_contrato", "direccion", "telefono", "poblacion", "localidad", "email", "dni", "titular") VALUES
	(1, 'Padre manjón, 16, 2-D', 632759686, 'Granada', 'Atarfe', 'maruanbueno55@gmail.com', 'x7537108p', 'Maruan Boukhriss');
/*!40000 ALTER TABLE "hogar" ENABLE KEYS */;

-- Volcando estructura para tabla public.incidente
CREATE TABLE IF NOT EXISTS "incidente" (
	"id_incidente" INTEGER NOT NULL,
	"id_seguridad" INTEGER NOT NULL,
	"motivo" TEXT NULL DEFAULT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	"updated_at" TIMESTAMP NULL DEFAULT NULL,
	"resolucion" TEXT NULL DEFAULT NULL,
	"componente_afec" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("id_incidente"),
	CONSTRAINT "fk_seguridad" FOREIGN KEY ("id_seguridad") REFERENCES "seguridad" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Volcando datos para la tabla public.incidente: 2 rows
/*!40000 ALTER TABLE "incidente" DISABLE KEYS */;
INSERT IGNORE INTO "incidente" ("id_incidente", "id_seguridad", "motivo", "created_at", "updated_at", "resolucion", "componente_afec") VALUES
	(1, 1, 'Intrusión en la parte posterior del jardin', '2020-05-07 16:15:12', '2012-12-12 00:00:00', 'Alerta a la seguridad nacional con los datos capturados', 'Camara'),
	(2, 1, 'Intrusión en la parte posterior del baño', '2020-05-20 02:29:00', '2012-12-12 00:00:00', 'Se ha alertado a los agentes.', 'Sensor');
/*!40000 ALTER TABLE "incidente" ENABLE KEYS */;

-- Volcando estructura para tabla public.jobs
CREATE TABLE IF NOT EXISTS "jobs" (
	"id" BIGINT NOT NULL DEFAULT 'nextval(''jobs_id_seq''::regclass)',
	"queue" VARCHAR(255) NOT NULL,
	"payload" TEXT NOT NULL,
	"attempts" SMALLINT NOT NULL,
	"reserved_at" INTEGER NULL DEFAULT NULL,
	"available_at" INTEGER NOT NULL,
	"created_at" INTEGER NOT NULL,
	PRIMARY KEY ("id"),
	INDEX "jobs_queue_index" ("queue")
);

-- Volcando datos para la tabla public.jobs: 0 rows
/*!40000 ALTER TABLE "jobs" DISABLE KEYS */;
/*!40000 ALTER TABLE "jobs" ENABLE KEYS */;

-- Volcando estructura para tabla public.luces
CREATE TABLE IF NOT EXISTS "luces" (
	"salon" BOOLEAN NULL DEFAULT NULL,
	"baño" BOOLEAN NULL DEFAULT NULL,
	"habitacion" BOOLEAN NULL DEFAULT NULL,
	"cocina" BOOLEAN NULL DEFAULT NULL,
	"id_luces" BIGINT NOT NULL,
	PRIMARY KEY ("id_luces")
);

-- Volcando datos para la tabla public.luces: 1 rows
/*!40000 ALTER TABLE "luces" DISABLE KEYS */;
INSERT IGNORE INTO "luces" ("salon", "baño", "habitacion", "cocina", "id_luces") VALUES
	('false', 'false', 'false', 'false', 2);
/*!40000 ALTER TABLE "luces" ENABLE KEYS */;

-- Volcando estructura para tabla public.migrations
CREATE TABLE IF NOT EXISTS "migrations" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''migrations_id_seq''::regclass)',
	"migration" VARCHAR(255) NOT NULL,
	"batch" INTEGER NOT NULL,
	PRIMARY KEY ("id")
);

-- Volcando datos para la tabla public.migrations: 24 rows
/*!40000 ALTER TABLE "migrations" DISABLE KEYS */;
INSERT IGNORE INTO "migrations" ("id", "migration", "batch") VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2019_08_19_000000_create_failed_jobs_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 2),
	(4, '2020_05_14_121700_create_notifications_table', 2),
	(5, '2020_05_14_122551_create_jobs_table', 3),
	(6, '2020_05_14_213235_create_componentes_table', 0),
	(7, '2020_05_14_213235_create_incidente_table', 0),
	(8, '2020_05_14_213235_create_seguridad_table', 0),
	(9, '2020_05_14_213235_create_jobs_table', 0),
	(10, '2020_05_14_213235_create_users_table', 0),
	(11, '2020_05_14_213235_create_failed_jobs_table', 0),
	(12, '2020_05_14_213235_create_accesibilidad_table', 0),
	(13, '2020_05_14_213235_create_notifications_table', 0),
	(14, '2020_05_14_213235_create_energia_table', 0),
	(15, '2020_05_14_213235_create_hogar_table', 0),
	(16, '2020_05_14_213235_create_luces_table', 0),
	(17, '2020_05_14_213235_create_password_resets_table', 0),
	(18, '2020_05_14_213236_add_foreign_keys_to_componentes_table', 0),
	(19, '2020_05_14_213236_add_foreign_keys_to_incidente_table', 0),
	(20, '2020_05_14_213236_add_foreign_keys_to_accesibilidad_table', 0),
	(21, '2020_05_14_213236_add_foreign_keys_to_energia_table', 0),
	(22, '2020_05_15_134655_create_websockets_statistics_entries_table', 4),
	(23, '2020_05_16_121231_create_push_subscriptions_table', 5),
	(24, '2020_05_30_133410_create_items_table', 6);
/*!40000 ALTER TABLE "migrations" ENABLE KEYS */;

-- Volcando estructura para tabla public.notifications
CREATE TABLE IF NOT EXISTS "notifications" (
	"id" UUID NOT NULL,
	"type" VARCHAR(255) NOT NULL,
	"notifiable_type" VARCHAR(255) NOT NULL,
	"notifiable_id" BIGINT NOT NULL,
	"data" TEXT NOT NULL,
	"read_at" TIMESTAMP NULL DEFAULT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	"updated_at" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	INDEX "notifications_notifiable_type_notifiable_id_index" ("notifiable_type", "notifiable_id")
);

-- Volcando datos para la tabla public.notifications: 4 rows
/*!40000 ALTER TABLE "notifications" DISABLE KEYS */;
INSERT IGNORE INTO "notifications" ("id", "type", "notifiable_type", "notifiable_id", "data", "read_at", "created_at", "updated_at") VALUES
	('2274753c-c437-4ae8-8d49-5c61dde11a9a', 'App\Notifications\EmailNotification', 'App\User', 14, '{"data":{"id":14,"name":"Cristina Ascaso","email":"test@test.com","email_verified_at":null,"created_at":"2020-05-27T22:02:14.000000Z","updated_at":"2020-05-27T22:02:14.000000Z"},"user_id":6,"user_email":"maruanbueno55@gmail.com"}', NULL, '2020-05-27 22:04:33', '2020-05-28 00:21:00'),
	('69f22783-c25b-4aaa-851c-bd26a8b0b7ce', 'App\Notifications\EmailNotification', 'App\User', 14, '{"data":{"id":14,"name":"Cristina Ascaso","email":"test@test.com","email_verified_at":null,"created_at":"2020-05-27T22:02:14.000000Z","updated_at":"2020-05-27T22:02:14.000000Z"},"user_id":6,"user_email":"maruanbueno55@gmail.com"}', NULL, '2020-05-27 22:04:33', '2020-05-28 00:21:24'),
	('1b23b6f6-f176-41bf-a8a4-263e49ab8887', 'App\Notifications\EmailNotification', 'App\User', 14, '{"data":{"id":14,"name":"Cristina Ascaso","email":"test@test.com","email_verified_at":null,"created_at":"2020-05-27T20:02:14.000000Z","updated_at":"2020-05-27T20:02:14.000000Z"},"user_id":6,"user_email":"maruanbueno55@gmail.com"}', NULL, '2020-05-28 12:59:48', '2020-05-28 12:59:48'),
	('0b4c76fe-aba7-4228-bc41-739912b34d7d', 'App\Notifications\EmailNotification', 'App\User', 14, '{"data":{"id":14,"name":"Cristina Ascaso","email":"test@test.com","email_verified_at":null,"created_at":"2020-05-27T20:02:14.000000Z","updated_at":"2020-05-27T20:02:14.000000Z"},"user_id":6,"user_email":"maruanbueno55@gmail.com"}', NULL, '2020-05-28 12:59:48', '2020-05-28 12:59:48');
/*!40000 ALTER TABLE "notifications" ENABLE KEYS */;

-- Volcando estructura para tabla public.password_resets
CREATE TABLE IF NOT EXISTS "password_resets" (
	"email" VARCHAR(255) NOT NULL,
	"token" VARCHAR(255) NOT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	INDEX "password_resets_email_index" ("email")
);

-- Volcando datos para la tabla public.password_resets: 0 rows
/*!40000 ALTER TABLE "password_resets" DISABLE KEYS */;
/*!40000 ALTER TABLE "password_resets" ENABLE KEYS */;

-- Volcando estructura para tabla public.seguridad
CREATE TABLE IF NOT EXISTS "seguridad" (
	"id" INTEGER NOT NULL,
	"simulacion_prese" BOOLEAN NULL DEFAULT NULL,
	"fugas_gas" BOOLEAN NULL DEFAULT NULL,
	"vigilancia_auto" BOOLEAN NULL DEFAULT NULL,
	"control_rem" BOOLEAN NULL DEFAULT NULL,
	"incendios" BOOLEAN NULL DEFAULT NULL,
	"fallos_elec" BOOLEAN NULL DEFAULT NULL,
	"camara" BOOLEAN NULL DEFAULT NULL,
	"alarma" BOOLEAN NULL DEFAULT NULL,
	"sensores" BOOLEAN NULL DEFAULT NULL,
	"view_count" BIGINT NULL DEFAULT NULL,
	"sensor_pin" VARCHAR(260) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Volcando datos para la tabla public.seguridad: 1 rows
/*!40000 ALTER TABLE "seguridad" DISABLE KEYS */;
INSERT IGNORE INTO "seguridad" ("id", "simulacion_prese", "fugas_gas", "vigilancia_auto", "control_rem", "incendios", "fallos_elec", "camara", "alarma", "sensores", "view_count", "sensor_pin") VALUES
	(1, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 0, '$2y$10$QuQloR9g9j3zJNV1niEsLOYlXn5Y0wY/L2VFrz6ipWva7Jeu7HMse');
/*!40000 ALTER TABLE "seguridad" ENABLE KEYS */;

-- Volcando estructura para tabla public.users
CREATE TABLE IF NOT EXISTS "users" (
	"id" BIGINT NOT NULL DEFAULT 'nextval(''users_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"email" VARCHAR(255) NOT NULL,
	"email_verified_at" TIMESTAMP NULL DEFAULT NULL,
	"password" VARCHAR(255) NOT NULL,
	"remember_token" VARCHAR(100) NULL DEFAULT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	"updated_at" TIMESTAMP NULL DEFAULT NULL,
	"last_login_ip" TEXT NULL DEFAULT NULL,
	UNIQUE INDEX "users_email_unique" ("email"),
	PRIMARY KEY ("id")
);

-- Volcando datos para la tabla public.users: 0 rows
/*!40000 ALTER TABLE "users" DISABLE KEYS */;
/*!40000 ALTER TABLE "users" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
