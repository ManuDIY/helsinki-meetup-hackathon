## Setup Kontena environment

### Step 1. Install Kontena CLI (command-line interface)
You can install the Kontena CLI with Rubygems package manager (included in Ruby).

```
$ gem install kontena-cli
```

### Step 2. Register Personal User Account

```
$ kontena register
```

### Step 3. Install Kontena Master
```
$ export DO_TOKEN=your_digital_ocean_token
$ export SSH_KEY=path_to_ssh_key
```

```
$ kontena master digitalocean create \
  --token $DO_TOKEN \
  --ssh-key $SSH_KEY \
  --size 512mb
```

### Step 4. Login and Create a Grid

```
$ kontena login http://192.168.66.100:8080
Email: your.email@domain.com
Password: *********
 _               _
| | _ ___  _ __ | |_ ___ _ __   __ _
| |/ / _ \| '_ \| __/ _ \ '_ \ / _` |
|   < (_) | | | | ||  __/ | | | (_| |
|_|\_\___/|_| |_|\__\___|_| |_|\__,_|
-------------------------------------
Copyright (c)2016 Kontena, Inc.

Logged in as your.email@domain.com
Welcome! See 'kontena --help' to get started.
```

```
$ kontena grid create hackathon
```

### Step 5. Install Kontena Nodes

```
kontena node digitalocean create \
  --token $DO_TOKEN \
  --ssh-key $SSH_KEY \
```

Repeat this step to provision additional Kontena Nodes to your Grid.

### Step 6. Verify Installation

```
$ kontena node list
```

Congratulations! Now you can proceed to deploy an application.
