import subprocess
import json
import datetime

def delete_old_workflows():
    argo_namespace = "argo"
    current_date = datetime.datetime.now(datetime.timezone.utc)
    threshold = datetime.timedelta(days=2)

    # Get the list of Argo Workflow runs
    cmd = ["argo", "list", "-n", argo_namespace, "-o", "json"]
    try:
        output = subprocess.check_output(cmd)
        workflows = json.loads(output)
    except subprocess.CalledProcessError as e:
        print(f"Error getting Argo workflows: {e}")
        return

    for workflow in workflows:
        started_at = workflow["status"].get("startedAt", workflow["metadata"]["creationTimestamp"])
        started_at_datetime = datetime.datetime.fromisoformat(started_at.replace("Z", "+00:00"))
        age = current_date - started_at_datetime

        if age > threshold:
            workflow_name = workflow["metadata"]["name"]
            print(f"Deleting Argo workflow: {workflow_name}")
            try:
                subprocess.check_output(["argo", "delete", "-n", argo_namespace, workflow_name])
            except subprocess.CalledProcessError as e:
                print(f"Error deleting Argo workflow: {e}")

if __name__ == "__main__":
    delete_old_workflows()