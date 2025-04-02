# Data Engineering with Spark

## Lab 6: Structured Streaming

### Goals

- Stream the NYC Taxi datasets on a socket
- Use Spark Streaming to analyze the stream

### Lab resources

- The `data` directory contains the NYC Taxi datasets;
- The `stream_taxi_data_socket.py` allows to stream a dataset through a socket on a given port.

### Streaming the datasets

To stream the NY datasets:
- Clone this class' repo from GitHub to your /home/$USER/ on the edge node:
  ```
  git clone https://github.com/oudine13/module6_lab.git
  ```
- Go to this directory:
  ```
  cd module6_lab/lab-resources
  ```
- Create a checkpoint directory for Spark Streaming in your HDFS personal folder:
  ```bash
  hdfs dfs -mkdir -p "/education/$GROUP/big-data/2025/fall/$USER/spark-streaming/checkpoint"
  ```
- Run the `stream_taxi_data_socket.py` script. The script has 3 parameters: the server name to use to stream the data, the port on which to open the socket, the dataset to stream (can be either `fares` or `rides`)
  ```bash
  PORT=11111
  hdfs dfs -rm -r -f "/education/$GROUP/big-data/2025/fall/$USER/spark-streaming/checkpoint/*"
  python3 stream_taxi_data_socket.py edge-1.au.adaltas.cloud "$PORT" fares
  ```
- On new terminal, ssh connect on edge node, and enter
```bash
nc edge-1.au.adaltas.cloud 11111
```
