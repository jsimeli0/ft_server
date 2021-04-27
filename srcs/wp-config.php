<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'jsimelio' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '{i>ZrU_JF!3GyJX8$BkhN`,xpvcIIkH++$&zs`%mqq$BqO5465^-|9kX++$3t+tA');
define('SECURE_AUTH_KEY',  '26;C4nHk,DIIE$@eL!o^v(PAeJ=:6BgG%CmQE.=KNHi~5*oVRMG{6)}-@D!G(,<@');
define('LOGGED_IN_KEY',    '*eA*5O<-?<ReC,t*LC}+Gi0oqy$Ohk=?]j5Zu=Ga~2)1=%Fby-d~XRVS`Vl].|Ja');
define('NONCE_KEY',        '^tSKKn-[b+4*RXfD[[t`~pU%;wq+RB[D/ck5|LSd;elozX/I-+*p:+phAgD)j,UR');
define('AUTH_SALT',        '!b&R$P-hR*&+91KVQ#-,5m9X+<YV:[>lwwr(,Qg$!8Q^CVU2wZhh9.zc18|&jQ3Q');
define('SECURE_AUTH_SALT', '[ Qx8]v@1D_zAC=<;L|B^s(>,.Vmj_oVn.$jS#6P(?I-&2+Dm0TVf~1c0caB-Y]F');
define('LOGGED_IN_SALT',   '6W>fd8:Qytd 0!%`/0o.=m0dRYndzz~9xgIwXg|+p.PXTK-Ey@sY)s0XC~MFR@eD');
define('NONCE_SALT',       '4c%OqJg)pC,~>l^wb)}cO/H0`Q|9S6/27RaX2>F ,ag,kY;S_+i6tCH+>m1)FErJ');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );