# frozen_string_literal: true

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


require "helper"

describe Google::Cloud::Bigtable::Convert, :mock_bigtable do
  describe "number_to_duration" do
    it "returns nil when given number is nil" do
      duration = Google::Cloud::Bigtable::Convert.number_to_duration(nil)
      _(duration).must_be :nil?
    end

    it "convert an integer to duration" do
      number = 100
      duration = Google::Cloud::Bigtable::Convert.number_to_duration(number)
      _(duration).must_be_kind_of Google::Protobuf::Duration
      _(duration.seconds).must_equal 100
      _(duration.nanos).must_equal 0
    end

    it "converts a float numner to duration" do
      number = 100.2
      duration = Google::Cloud::Bigtable::Convert.number_to_duration(number)
      _(duration).must_be_kind_of Google::Protobuf::Duration
      _(duration.seconds).must_equal 100
      _(duration.nanos).must_equal 200000000
    end
  end

  describe "duration_to_number" do
    it "returns nil when given duration is nil" do
      number = Google::Cloud::Bigtable::Convert.duration_to_number(nil)
      _(number).must_be :nil?
    end

    it "converts duaration with seconds and return an integer" do
      seconds = 100
      duration = Google::Protobuf::Duration.new(seconds: seconds, nanos: 0)
      number = Google::Cloud::Bigtable::Convert.duration_to_number(duration)
      _(number).must_equal seconds
    end

    it "converts duration with seconds and nano seconds and return a float" do
      duration = Google::Protobuf::Duration.new(seconds: 100, nanos: 200000000)
      number = Google::Cloud::Bigtable::Convert.duration_to_number(duration)
      _(number).must_equal 100.2
    end

    it "converts duration with zero second and nano seconds and return a float" do
      duration = Google::Protobuf::Duration.new(nanos: 200000000)
      number = Google::Cloud::Bigtable::Convert.duration_to_number(duration)
      _(number).must_equal 0.200000000
    end
  end

  describe "timestamp_to_time" do
    it "returns nil when given timestamp value is nil" do
      time = Google::Cloud::Bigtable::Convert.timestamp_to_time(nil)
      _(time).must_be :nil?
    end

    it "converts timestamp with only seconds protobuf to Time" do
      seconds = 1526736908
      timestamp = Google::Protobuf::Timestamp.new(seconds: seconds)
      time = Google::Cloud::Bigtable::Convert.timestamp_to_time(timestamp)
      _(time).must_equal Time.at(seconds)
    end

    it "converts timestamp with seconds and nano seconds protobuf to Time" do
      seconds = 1526738304
      nanos = 411108000
      micro = nanos / 1000.0
      timestamp = Google::Protobuf::Timestamp.new(seconds: seconds, nanos: nanos)
      time = Google::Cloud::Bigtable::Convert.timestamp_to_time(timestamp)
      _(time).must_be_kind_of Time
      _(time).must_equal Time.at(seconds, micro)
    end
  end

  describe "time_to_timestamp" do
    it "returns nil when given time value is nil" do
      timestamp = Google::Cloud::Bigtable::Convert.time_to_timestamp(nil)
      _(timestamp).must_be :nil?
    end

    it "converts Time to protobuf Timestamp" do
      seconds = 1526738304
      nanos = 411108000
      micro = nanos / 1000.0
      time = Time.at(seconds, micro)
      timestamp = Google::Cloud::Bigtable::Convert.time_to_timestamp(time)
      _(timestamp).must_be_kind_of Google::Protobuf::Timestamp
      _(timestamp).must_equal Google::Protobuf::Timestamp.new(seconds: seconds, nanos: nanos)
      _(timestamp.seconds).must_equal seconds
      _(timestamp.nanos).must_equal nanos
    end
  end
end
