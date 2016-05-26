## Deploy Todo Application

### Step 1. Go to `todo` folder

```sh
$ cd todo
```

### Step 2. Verify kontena.yml

```yaml
$ cat kontena.yml
mongodb:
  image: mongo:3.2
  command: mongod --smallfiles

app:
  image: kontena/todo-example:latest
  ports:
    - 80:9292
  links:
    - mongodb:mongodb
  environment:
    - MONGODB_URI=mongodb://%{project}-mongodb.kontena.local/todo_production
  command: bundle exec puma -p 9292 -e production
```

### Step 3. Deploy the Application

```sh
$ kontena app deploy
```

### Step 4. Verify the Deployment

```sh
$ kontena app show app
```

Pick up the public ip address of the node where the app is running and open in a browser http://node_ip_address/


### Step 5. Change MongoDB as Stateful

Every time `mongodb` is deployed all the data is lost. To persist data to host node and re-use it we can define `mongodb` service as stateful.

```sh
$ kontena app rm
```

Modify kontena.yml

```yaml
mongodb:
  image: mongo:3.2
  command: mongod --smallfiles
  stateful: true
```

```
$ kontena app deploy
```
