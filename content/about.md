---
title: About
---

The Lanyonesque theme is a port of the popular [Jekyll][jekyll] [Lanyon
theme][lanyon] created by [Mark Otto][mdo]. The author of the port is
[Baldur Kristinsson][bk]. The theme is lightweight and mobile-friendly.

[lanyon]: http://lanyon.getpoole.com
[jekyll]: https://jekyllrb.com
[mdo]: https://twitter.com/mdo
[bk]: https://github.com/bk/

## Setup

In your `wmk` project put the `lanyonesque` theme inside the `themes`
subdirectory.  Then add the setting `theme: lanyonesque` to your
`wmk_config.yaml`.

Lanyonesque expects quite a few settings and context variables to be present.
Here is a sample `wmk_config.yaml` file demonstrating them:

```yaml
default_template: base/default.mhtml
markdown_extensions: ['extra', 'sane_lists', 'codehilite']
theme: lanyonesque
template_context:
    site_title: Lanyonesque
    site_base_url: https://wmk-example.net
    site_tagline: A port of the Jekyll Lanyon theme
    site_lang: en
    site_description: |
        This is an example site illustrating Lanyonesque,
        which is a port of the Jekyll theme Lanyon to wmk.
    site_paginate: 4
    site_author: Dr. Hastie Lanyon
    site_author_email: hl@wmk-example.net
    site_body_css_class: layout-reverse
```

All of the context variables used by the theme have names starting with `site`.
Some of them are required, others are optional but recommended.

It is not necessary to add `codehilite` to `markdown_exensions` unless you
intend to use fenced code blocks in your markdown content.

### Theme appearance

Lanyonesque supports some modifications to the appearance and
functionality of the theme through the context variable
`site_body_css_class` as seen above. This sets the `<body>` class(es) in the
default base template.

The following css classes are supported in the value of `site_body_css_class`.

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

## File organization

By default, Lanyonesque is a blog-oriented theme. If you wish to change this,
you need to override the frontpage (`index.mhtml`) as well as the `sidebar` def
of the default base template, `base/default.mhtml`.

Blog entries go into `content/posts`. They should specify `title`, `pubdate` (a
date in ISO format) and `template` in their frontmatter. Normally the value of
`template` should be `base/post.mhtml`. Blog entries are displayed on the
frontpage which paginated. The value of `site_paginate` determines how many
entries are displayed at a time.

If most of your content consists of blog entries, it may be convenient to
change the `default_template` value in `wmk_config.yaml` to `base/post.mhtml`,
in which case the `template` setting in the blog entry frontmatter can be
omitted.

Other files in `content` are regarded as "pages" and go into the navigation in
the sidebar. A page does not need to specify a `pubdate` and should normally
have a `template` value of `base/page.mhtml`.

## Standalone templates

Lanyonesque provides three standalone templates:

- The frontpage, `index.mhtml` - see above.
- An Atom feed listing blog entries, `atom.xml.mhtml`.
- A 404 page, `404.mhtml`. (Note that the produced `/404.html` page will not
  be actually used unless your webserver is configured appropriately.)

