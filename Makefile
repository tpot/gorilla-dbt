STORY_MATERIALS_URL=https://github.com/emljames/GorillaR/raw/refs/heads/master/story_materials.zip

DATA_FILES=data_exp_4424-v9_task-lwe7.csv \
	data_exp_4424-v9_task-y5i7.csv \
	data_exp_4424-v9_task-z5kw.csv \
	item-conds.csv

data: $(addprefix data/,$(DATA_FILES))
.PHONY: data

$(addprefix data/,$(DATA_FILES)): data/story_materials.zip
	unzip -o -d data -j $<

data/story_materials.zip:
	wget -O data/$(notdir $@) $(STORY_MATERIALS_URL)

# macOS
act:
	act -P ubuntu-24.04=myoung34/github-runner:ubuntu-noble \
		--container-daemon-socket /var/run/docker.sock

clean:
	rm -f data/story_materials.zip $(addprefix data/,$(DATA_FILES))
