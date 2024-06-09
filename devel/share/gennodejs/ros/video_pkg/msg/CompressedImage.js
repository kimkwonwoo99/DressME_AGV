// Auto-generated. Do not edit!

// (in-package video_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class CompressedImage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
      this.width = null;
      this.height = null;
      this.format = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('format')) {
        this.format = initObj.format
      }
      else {
        this.format = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CompressedImage
    // Serialize message field [data]
    bufferOffset = _arraySerializer.uint8(obj.data, buffer, bufferOffset, null);
    // Serialize message field [width]
    bufferOffset = _serializer.uint32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.uint32(obj.height, buffer, bufferOffset);
    // Serialize message field [format]
    bufferOffset = _serializer.string(obj.format, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CompressedImage
    let len;
    let data = new CompressedImage(null);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    // Deserialize message field [width]
    data.width = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [format]
    data.format = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.data.length;
    length += _getByteLength(object.format);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'video_pkg/CompressedImage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '30dde7683502af43aca6cf366dc86787';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8[] data
    uint32 width
    uint32 height
    string format
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CompressedImage(null);
    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.format !== undefined) {
      resolved.format = msg.format;
    }
    else {
      resolved.format = ''
    }

    return resolved;
    }
};

module.exports = CompressedImage;
