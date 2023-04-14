#!/bin/bash

api="https://api.waifu.pics"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_random_waifu() {
    # 1 - category: (string): <sfw, nsfw - default: sfw>
    # 2 - tags: (string): <tags - default: none>
    # 3 - hidden: (boolean): <true, false - default: false>
    curl --request GET \
		--url "$api/$1/waifu" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--data '{
			"category": "'${2:-sfw}'",
			"tags": "'${3:-none}'",
			"hidden": "'${4:-false}'"
		}'
}

function get_specific_waifu() {
    # 1 - category: (string): <sfw, nsfw - default: sfw>
    # 2 - id: (integer): <id>
    curl --request GET \
		--url "$api/$1/waifu/$2" \
		--user-agent "$user_agent" \
		--header "content-type: application/json"
}

function get_waifu_by_tag() {
    # 1 - category: (string): <sfw, nsfw - default: sfw>
    # 2 - tags: (string): <tags>
    # 3 - hidden: (boolean): <true, false - default: false>
    curl --request GET \
		--url "$api/$1/tags/$2" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--data '{
			"hidden": "'${3:-false}'"
		}'
}

function get_waifu_by_series() {
    # 1 - category: (string): <sfw, nsfw - default: sfw>
    # 2 - series: (string): <series>
    # 3 - hidden: (boolean): <true, false - default: false>
    curl --request GET \
		--url "$api/$1/series/$2" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--data '{
			"hidden": "'${3:-false}'"
		}'
}

function get_waifu_by_color() {
    # 1 - category: (string): <sfw, nsfw - default: sfw>
    # 2 - color: (string): <color>
    # 3 - hidden: (boolean): <true, false - default: false>
    curl --request GET \
		--url "$api/$1/colors/$2" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--data '{
			"hidden": "'${3:-false}'"
		}'
}
