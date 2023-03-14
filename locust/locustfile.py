import time
from locust import HttpUser, task, between

class QuickstartUser(HttpUser):
    wait_time = between(1, 5)

    @task
    def hello_world(self):
        self.client.get("/pages")
        self.client.get("/index.php")
        print(self.client)
        self.stop()
   

    def on_start(self):
        self.client.post("/pages/samples/login.php", {"email":"q@gmail.com", "Password":"1"})
        print(self.client.post("/pages/samples/login.php", {"email":"q@gmail.com", "Password":"1"}))
        self.client.get("/")
        