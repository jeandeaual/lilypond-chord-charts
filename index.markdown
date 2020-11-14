---
layout: default
---

{% assign a4_files = site.static_files | where: "a4", true | where: "extname", ".pdf" | sort: "basename" %}
{% assign letter_files = site.static_files | where: "letter", true | where: "extname", ".pdf" | sort: "basename" %}
{% assign svg_files = site.static_files | where: "svg", true | where: "extname", ".svg" | sort: "basename" %}
{% assign midi_files = site.static_files | where: "midi", true | where: "extname", ".midi" | sort: "basename" %}

# Downloads

{% if a4_files != empty %}
## A4
    {% for file in a4_files %}
* [{{ file.name }}]({{ file.path | relative_url }})
    {% endfor %}
{% endif %}

{% if letter_files != empty %}
## Letter
    {% for file in letter_files %}
* [{{ file.name }}]({{ file.path | relative_url }})
    {% endfor %}
{% endif %}

{% if midi_files != empty %}
## MIDI
    {% for file in midi_files %}
* [{{ file.name }}]({{ file.path | relative_url }})
    {% endfor %}
{% endif %}

{% if svg_files != empty %}
# Preview
    {% assign svg_file_count = 0 %}
    {% for file in svg_files %}
        {% assign suffix = file.basename | slice: -2, 2 %}
        {% comment %}
        If there are multiple pages per output, only count the first one
        {% endcomment %}
        {% if suffix == "-1" %}
            {% assign svg_file_count = svg_file_count | plus: 1 %}
        {% endif %}
    {% endfor %}
    {% if svg_file_count == 0 %}
        {% assign svg_file_count = svg_files | size %}
    {% endif %}
    {% for file in svg_files %}
        {% assign suffix = file.basename | slice: -2, 2 %}
        {% if svg_file_count > 1 %}
            {% comment %}
            If there's a single page, print the title as-is
            {% endcomment %}
            {% unless suffix contains "-" %}
## {{ file.basename }}
            {% endunless %}
            {% comment %}
            Check if the basename ends with "-1", then add a title containing the basename without "-1"
            {% endcomment %}
            {% if suffix == "-1" %}
## {{ file.basename | split: "" | reverse | join: "" | remove_first: "1-" | split: "" | reverse | join: "" }}
            {% endif %}
        {% endif %}
![{{ file.basename }}]({{ file.path | relative_url }})
    {% endfor %}
{% endif %}

Last update on {{ site.time | date: "%Y-%m-%d %H:%M UTC" }}.
