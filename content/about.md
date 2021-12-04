---
title: About
---

The Lanyonesque theme is a port to [wmk][wmk] of the popular
[Jekyll][jekyll] [Lanyon theme][lanyon] created by [Mark Otto][mdo]. The author
of the port is [Baldur Kristinsson][bk]. The theme is lightweight and
mobile-friendly. It especially suitable for a personal blog but can easily
be adapted for other purposes. A demo can be found [here][demo].

[lanyon]: http://lanyon.getpoole.com
[jekyll]: https://jekyllrb.com
[mdo]: https://twitter.com/mdo
[bk]: https://github.com/bk/
[wmk]: https://github.com/bk/wmk/
[demo]: https://lanyonesque.baldr.net/

## Setup

In your `wmk` project put the `lanyonesque` theme inside the `themes`
subdirectory.  Then add the setting `theme: lanyonesque` to your
`wmk_config.yaml`.

Lanyonesque expects quite a few settings and context variables to be present.
Here is a sample `wmk_config.yaml` file demonstrating them:

```yaml
theme: lanyonesque
markdown_extensions: ['extra', 'sane_lists', 'codehilite']
site:
    title: Lanyonesque
    base_url: https://wmk-example.net
    leading_path: ''
    tagline: A port of the Jekyll theme Lanyon to wmk
    lang: en
    date_format: "%d %b %Y"
    datetime_format: "%d %b %Y %H:%M"
    description: |
        This is an example site illustrating Lanyonesque,
        which is a port of the Jekyll theme Lanyon to wmk.
    paginate: 4
    posts_list_detail: summary
    author: Dr. Hastie Lanyon
    author_email: hl@wmk-example.net
    body_css_class: layout-reverse sidebar-overlay
```

All of the context variables used by the theme have names starting with `site`.
Some of them are required, others are optional but recommended.

It is not necessary to add `codehilite` to `markdown_exensions` unless you
intend to use fenced code blocks in your markdown content.

Many of the settings should be self-explanatory. Here are the exceptions:

- `site.base_url`: This is the hostname where the site will be hosted, with
  either 'https://' or 'http://' in front. It should **not** end with a slash.
  This variable is only used in the `atom.xml` file.

- `site.leading_path`: This is the directory on the host where everything which
  `wmk` puts into `htdocs` will be located, relative to the host's webroot. If
   you host the site on a separate domain or subdomain, this should be an empty
   string.  If anything is set here, it should start with a slash and end
   without one. Example: `/mypages/blog`.

- `site.date_format` and `site.datetime_format`: Formatting strings for
  `strftime()`. The former is used for date objects, the latter for datetime
  objects. This affects how blog entries are displayed. The defaults are
  `%Y-%m-%d` and `%Y-%m-%d %H:%M`, respectively. See `templates/lib/dates.mc` for
  details.

- `site.paginate`: How many posts at a time should be displayed on the front
  page before pagination kicks in. The default is 5.

- `site.posts_list_detail`: What level of detail of a blog post should be shown
  in a list page. The possible values are "title", "summary" and "full", which
  is the default. If "summary" is specified, the frontmatter `summary` of the
  blog post is used if available (note that it may contain markdown); otherwise
  the first paragraph of the post is shown.

- `site.body_css_class`: controls the appearance of the topnav and sidebar; see
  below.

### Theme appearance

Lanyonesque supports some modifications to the appearance and
functionality of the theme through the context variable
`site.body_css_class` as seen above. This sets the `<body>` class(es) in the
default base template.

The following css classes are supported in the value of `site.body_css_class`.

- Colour theme: `theme-base-08` (red), `theme-base-09` (orange),
  `theme-base-0a` (yellow), `theme-base-0b` (green), `theme-base-0c` (teal),
  `theme-base-0d` (blue), theme-base-0e (violet), or `theme-base-0f` (brown).
  New themes can be created by adding a few lines of CSS - see
  `assets/scss/_themes.scss` for details.
- `layout-reverse` moves the sidebar (and menu button) to the right instead of
  the default left.
- `sidebar-overlay` makes the sidebar go on top of the content instead of
  pushing it to the side, which is the default.

All of these settings are inherited from Lanyon.

### Fonts

Lanyonesque, like Lanyon, uses the font PT Serif for body text and PT Sans for
most other things. You can customize the fonts by overriding
`assets/scss/lanyonesque.scss` and setting the Sass variables `$sans-font` and
`$serif-font`. If you do this, you would probably also want to override the
Mako component `templates/base/fonts.mc` which defines the necessary CSS
`@font-face` imports (via Google Fonts).

## File organization

By default, Lanyonesque is a blog-oriented theme. If you wish to change this,
you need to override the frontpage (`index.mhtml`) as well as (probably) the
`sidebar` def of the default base template, `base/default.mhtml`.

Blog entries should have `section: blog` in their frontmatter. The template
should be set to `base/post.mhtml` or a similar page. The most convenient way
of accomplishing this is to put them in or under a directory (e.g.
`content/posts`) with the following `index.yaml` file:

```yaml
section: blog
template: base/post
```

Blog entries should also specify `title` and `pubdate` (which is a date or
datetime in ISO format). If `pubdate` is missing, the modification of the
file is used instead.

Blog entries are displayed on the frontpage as a paginated list. The value of
`site.paginate` determines how many entries are displayed at a time.

Other files in `content` (i.e. those that do not have a `section` value of
`blog`) are regarded as "pages" and go into the navigation in the sidebar. A
page does not need to specify a `pubdate` and should normally have a `template`
value of `base/page.mhtml`.

## Standalone templates

Lanyonesque provides three standalone templates:

- The frontpage, `index.mhtml` - see above.
- An Atom feed listing blog entries, `atom.xml.mhtml`.
- A 404 page, `404.mhtml`. (Note that the produced `/404.html` page will not
  be actually used unless your webserver is configured appropriately.)

## Authors

- For Lanyonesque: **Baldur Kristinsson** <https://github.com/bk>.
- For Lanyon: **Mark Otto** <https://github.com/mdo>.

## License

MIT license.
