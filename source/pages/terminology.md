---
title: ValueSets and CodeSystems defined as part of this Implementation Guide
layout: default
active: terminology
---
### Value Sets

#### Method 1 is to render a *unsorted* list of valuesets using the IG Publisher generated simple list include file.

This liquid 'include' tag

{% raw %}
~~~
{% include list-simple-valuesets.xhtml %}
~~~
{% endraw %}


results in:

{% include list-simple-valuesets.xhtml %}

#### Method 2 is to render a sorted list using a custom liquid script:

This liquid syntax:

{% raw %}
~~~
{% assign html_pages = site.html_pages | sort: 'name' %}
{% for p in html_pages %}
  {% assign html_frag = p.name | split: '.' | size %}
  {% if p.name contains "ValueSet" and html_frag == 2 %}
      <li><a href="{{p.name}}">{{p.name |  remove: ".html" | replace: '-', ' ' }}</a></li>
  {% endif %}
{% endfor %}
~~~
{% endraw %}

results in:

{% assign html_pages = site.html_pages | sort: 'name' %}
{% for p in html_pages %}
{% assign html_frag = p.name | split: '.' | size %}
{% if p.name contains "ValueSet" and html_frag == 2 %}
  <li><a href="{{p.name}}">{{p.name |  remove: ".html" | replace: '-', ' ' }}</a></li>
{% endif %}
{% endfor %}


#### Method 3 is to render a custom list by manually creating the list using Markdown:

This markdown:

~~~
- [Foo Value Set](ValueSet-foo-codes.html)
- [Bar Value Set](ValueSet-bar-codes.html)
- [Blah Value Set](ValueSet-blah-codes.html)
~~~

results in:

- [Foo Value Set](#)
- [Bar Value Set](#)
- [Blah Value Set](#)

### Code Systems

**Code systems published in this IG** - Includes US Core defined code systems and externally defined code systems
{% include list-simple-codesystems.xhtml %}
