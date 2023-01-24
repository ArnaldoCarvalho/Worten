from locust import HttpUser, task

class Youtube(HttpUser):
    @task
    def Historico(self):
        self.client.get("/feed")
        self.client.get("/history")
    
    @task
    def Shinen13(self):
        self.client.get("/@shinen_13")