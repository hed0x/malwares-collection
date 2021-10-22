<?php
/*
 * bootcake Breadcrumbs
*/
function bootcake_custom_breadcrumbs() {

  $bootcake_showonhome = 0; // 1 - show breadcrumbs on the homepage, 0 - don't show
  $bootcake_delimiter = '/'; // bootcake_delimiter between crumbs
  $bootcake_home = __('Home','bootcake'); // text for the 'Home' link
  $bootcake_showcurrent = 1; // 1 - show current post/page title in breadcrumbs, 0 - don't show
  $bootcake_before = ' '; // tag before the current crumb
  $bootcake_after = ' '; // tag after the current crumb

  global $post;
  $bootcake_homelink = home_url('/');

  if (is_home() || is_front_page()) {

    if ($bootcake_showonhome == 1) echo '<li><a href="' . $bootcake_homelink . '">' . $bootcake_home . '</a></li>';

  }  else {

    echo '<li><a href="' . $bootcake_homelink . '">' . $bootcake_home . '</a> ' . $bootcake_delimiter . '';

   if ( is_category() ) {
      $bootcake_thisCat = get_category(get_query_var('cat'), false);
      if ($bootcake_thisCat->parent != 0) echo get_category_parents($bootcake_thisCat->parent, TRUE, ' ' . $bootcake_delimiter . ' ');
		echo $bootcake_before; _e('category','bootcake'); echo ' "'.single_cat_title('', false) . '"' . $bootcake_after;
    }
    elseif ( is_search() ) {
      echo $bootcake_before; _e('Search Results For','bootcake'); echo ' "'. get_search_query() . '"' . $bootcake_after;

    } elseif ( is_day() ) {
      echo '<a href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> ' . $bootcake_delimiter . ' ';
      echo '<a href="' . get_month_link(get_the_time('Y'),get_the_time('m')) . '">' . get_the_time('F') . '</a> ' . $bootcake_delimiter . ' ';
      echo $bootcake_before . get_the_time('d') . $bootcake_after;

    } elseif ( is_month() ) {
      echo '<a href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> ' . $bootcake_delimiter . ' ';
      echo $bootcake_before . get_the_time('F') . $bootcake_after;

    } elseif ( is_year() ) {
      echo $bootcake_before . get_the_time('Y') . $bootcake_after;

    } elseif ( is_single() && !is_attachment() ) {
      if ( get_post_type() != 'post' ) {
        $bootcake_post_type = get_post_type_object(get_post_type());
        $bootcake_slug = $bootcake_post_type->rewrite;
        echo '<a href="' . $bootcake_homelink . '/' . $bootcake_slug['slug'] . '/">' . $bootcake_post_type->labels->singular_name . '</a>';
        if ($bootcake_showcurrent == 1) echo ' ' . $bootcake_delimiter . ' ' . $bootcake_before . get_the_title() . $bootcake_after;
      } else {
        $bootcake_cat = get_the_category(); $bootcake_cat = $bootcake_cat[0];
        $bootcake_cats = get_category_parents($bootcake_cat, TRUE, ' ' . $bootcake_delimiter . ' ');
        if ($bootcake_showcurrent == 0) $bootcake_cats = preg_replace("#^(.+)\s$bootcake_delimiter\s$#", "$1", $bootcake_cats);
        echo $bootcake_cats;
        if ($bootcake_showcurrent == 1) echo $bootcake_before . get_the_title() . $bootcake_after;
      }

    } elseif ( !is_single() && !is_page() && get_post_type() != 'post' && !is_404() ) {
      $bootcake_post_type = get_post_type_object(get_post_type());
      echo $bootcake_before . $bootcake_post_type->labels->singular_name . $bootcake_after;

    } elseif ( is_attachment() ) {
      $bootcake_parent = get_post($post->post_parent);
      $bootcake_cat = get_the_category($bootcake_parent->ID); $bootcake_cat = $bootcake_cat[0];
      echo get_category_parents($bootcake_cat, TRUE, ' ' . $bootcake_delimiter . ' ');
      echo '<a href="' . get_permalink($bootcake_parent) . '">' . $bootcake_parent->post_title . '</a>';
      if ($bootcake_showcurrent == 1) echo ' ' . $bootcake_delimiter . ' ' . $bootcake_before . get_the_title() . $bootcake_after;

    } elseif ( is_page() && !$post->post_parent ) {
      if ($bootcake_showcurrent == 1) echo $bootcake_before . get_the_title() . $bootcake_after;

    } elseif ( is_page() && $post->post_parent ) {
      $bootcake_parent_id  = $post->post_parent;
      $bootcake_breadcrumbs = array();
      while ($bootcake_parent_id) {
        $bootcake_page = get_page($bootcake_parent_id);
        $bootcake_breadcrumbs[] = '<a href="' . get_permalink($bootcake_page->ID) . '">' . get_the_title($bootcake_page->ID) . '</a>';
        $bootcake_parent_id  = $bootcake_page->post_parent;
      }
      $bootcake_breadcrumbs = array_reverse($bootcake_breadcrumbs);
      for ($bootcake_i = 0; $bootcake_i < count($bootcake_breadcrumbs); $bootcake_i++) {
        echo $bootcake_breadcrumbs[$bootcake_i];
        if ($bootcake_i != count($bootcake_breadcrumbs)-1) echo ' ' . $bootcake_delimiter . ' ';
      }
      if ($bootcake_showcurrent == 1) echo ' ' . $bootcake_delimiter . ' ' . $bootcake_before . get_the_title() . $bootcake_after;

    } elseif ( is_tag() ) {
      echo $bootcake_before; _e('Posts tagged','bootcake'); echo ' "'.  single_tag_title('', false) . '"' . $bootcake_after;

    } elseif ( is_author() ) {
       global $author;
      $bootcake_userdata = get_userdata($author);
      echo $bootcake_before; _e('Articles posted by ','bootcake'); echo $bootcake_userdata->display_name . $bootcake_after;

    } elseif ( is_404() ) {
      echo $bootcake_before; _e('Error 404','bootcake'); echo $bootcake_after;
    }

    if ( get_query_var('paged') ) {
      if ( is_category() || is_day() || is_month() || is_year() || is_search() || is_tag() || is_author() ) echo ' (';
      echo __('Page','bootcake') . ' ' . get_query_var('paged');
      if ( is_category() || is_day() || is_month() || is_year() || is_search() || is_tag() || is_author() ) echo ')';
    }
    echo '</li>';

  }
}
