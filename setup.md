## Setup Kontena Environment on Digital Ocean

> NOTE: We are assuming in here you are setting up Kontena on Digital Ocean. Therefore, you'll need to obtain Digital Ocean API token. If you are participating Kontena Hackathon event, you'll get temporary SSH key and DO API token from the event organizers. If you are doing this Hackathon on your own, you'll need to use your own personal SSH key and DO API token.

### Step 1. Install Kontena CLI (command-line interface)

You can install the Kontena CLI with Rubygems package manager (included in Ruby).

```sh
$ gem install kontena-cli
```

Also install `droplet_kit` gem used for DigitalOcean provisioning

```sh
$ gem install droplet_kit
```

### Step 2. Register Personal User Account

```sh
$ kontena register
```

### Step 3. Install Kontena Master

```sh
$ export DO_TOKEN=your_digital_ocean_token
$ export SSH_KEY=path_to_ssh_key
```

```sh
$ kontena master digitalocean create \
  --token $DO_TOKEN \
  --ssh-key $SSH_KEY \
  --size 512mb
```

### Step 4. Login and Create a Grid

```sh
$ export SSL_IGNORE_ERRORS=true
$ kontena login --name=your_master_name https://your.master.address
```

Enter the login info:

```sh
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
