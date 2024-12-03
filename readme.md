# Mapreduce and Spark Benchmark on Linux Machine
This project is used in the goal of comparing the performance of parallel data processing in Mapreduce and Spark Engine. We want to see how much parallelisation can help dealing with big data and reduce the execution time. 

Apache Hadoop MapReduce is a popular framework for processing large data sets in parallel across a distributed cluster. It divides the input data into independent chunks which are processed in parallel across multiple nodes.
<br><br>
Apache Spark, on the other hand, is known for its advanced in-memory data processing capabilities. It can perform parallel processing more efficiently than MapReduce by keeping intermediate results in memory, reducing the need for disk storage and better supporting iterative algorithms.
<br><br>
In this project, we will benchmark the machine by running a simple Job : <b>Word Count</b> in Mapreduce and Spark .

## Requirements 
Docker 
Java version 1.8
Maven 
Linux Machine

## How to run 

first, we initialise the environment using this command
```
bash init-script.sh
```
then, we can run the spark script or the mapreduce script on the loaded file :
```
bash mapreduce.sh
```
```
bash spark.sh
```
To remove the results of the jobs run the `reset.sh` script
```
bash reset.sh
```
## BenchMark 
...
## License 
[MIT](https://opensource.org/license/mit)<br>
THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

