<?php

/*
 * thumbnail list
 */

function bootcake_thumbnail_image($content) {
    if (has_post_thumbnail())
        return the_post_thumbnail('thumbnail');
}

/*
 * Register OpenSans Google font for bootcake
 */

function bootcake_font_url() {
    $bootcake_font_url = '';
    if ('off' !== _x('on', 'OpenSans font: on or off', 'bootcake')) {
        $bootcake_font_url = add_query_arg('family', urlencode('OpenSans:300,400,700,900,300italic,400italic,700italic'), "//fonts.googleapis.com/css");
    }
    return $bootcake_font_url;
}


/*
 * bootcake Set up post entry meta.
 *
 * Meta information for current post: categories, tags, permalink, author, and date.
 */

function bootcake_entry_meta() {

    $bootcake_category_list = get_the_category_list(', ', ' ');
    $bootcake_tag_list = get_the_tag_list(' ', ', ');
    $bootcake_author = sprintf('<a href="%1$s" title="%2$s" >%3$s</a>', esc_url(get_author_posts_url(get_the_author_meta('ID'))), esc_attr(sprintf(__('View all posts by %s', 'bootcake'), get_the_author())), get_the_author());

    $bootcake_utility_text = '<ul>';
    if ($bootcake_category_list) {
        $bootcake_utility_text .= '<li>%1$s</li>';
    }
    if ($bootcake_tag_list) {
        $bootcake_utility_text .= '<li>%2$s</li>';
    }
    $bootcake_utility_text .= '<li>%3$s</li><li>' . bootcake_comment_number_custom() . '</li></ul>';
    printf(
            $bootcake_utility_text, $bootcake_category_list, $bootcake_tag_list, $bootcake_author
    );
}

function bootcake_comment_number_custom() {
    $bootcake_num_comments = get_comments_number(); // get_comments_number returns only a numeric value
    $bootcake_comments = __('No Comments', 'bootcake');
    if (comments_open()) {
        if ($bootcake_num_comments == 0) {
            $bootcake_comments = __('No Comments', 'bootcake');
        } elseif ($bootcake_num_comments > 1) {
            $bootcake_comments = $bootcake_num_comments . __(' Comments', 'bootcake');
        } else {
            $bootcake_comments = __('1 Comment', 'bootcake');
        }
    }
    return $bootcake_comments;
}

function bootcake_entry_meta_date() {
    $bootcake_date = sprintf('<a href="#" title="%1$s"> <b class="color-text">%2$s</b> <span>%3$s</span></a>', esc_attr(get_the_date('c')), esc_html(get_the_date('d')), esc_html(get_the_date('M' . ' ' . 'Y'))
    );
    printf($bootcake_date);
}

