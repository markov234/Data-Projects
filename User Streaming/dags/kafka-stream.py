
from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator

default_args = {
    'owner': 'airscholar',
    'start_date': datetime(2024, 11, 8, 22, 00)     # 8th November 2024, 10:00pm
}

with DAG('user_automation',
         default_args=default_args,
         schedule_interval='@daily',
         catchup=False) as dag