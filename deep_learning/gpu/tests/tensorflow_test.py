import tensorflow as tf
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'
sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
sess.run(tf.constant([1]))
