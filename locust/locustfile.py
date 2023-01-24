
from locust import HttpUser, task

class Worten(HttpUser):
    @task
    def Home(self):
        self.client.headers.setdefault('1')
        self.on_start()
        self.on_stop()