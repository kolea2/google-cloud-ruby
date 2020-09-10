# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/secretmanager/v1/resources.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/timestamp_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/secretmanager/v1/resources.proto", :syntax => :proto3) do
    add_message "google.cloud.secretmanager.v1.Secret" do
      optional :name, :string, 1
      optional :replication, :message, 2, "google.cloud.secretmanager.v1.Replication"
      optional :create_time, :message, 3, "google.protobuf.Timestamp"
      map :labels, :string, :string, 4
    end
    add_message "google.cloud.secretmanager.v1.SecretVersion" do
      optional :name, :string, 1
      optional :create_time, :message, 2, "google.protobuf.Timestamp"
      optional :destroy_time, :message, 3, "google.protobuf.Timestamp"
      optional :state, :enum, 4, "google.cloud.secretmanager.v1.SecretVersion.State"
      optional :replication_status, :message, 5, "google.cloud.secretmanager.v1.ReplicationStatus"
    end
    add_enum "google.cloud.secretmanager.v1.SecretVersion.State" do
      value :STATE_UNSPECIFIED, 0
      value :ENABLED, 1
      value :DISABLED, 2
      value :DESTROYED, 3
    end
    add_message "google.cloud.secretmanager.v1.Replication" do
      oneof :replication do
        optional :automatic, :message, 1, "google.cloud.secretmanager.v1.Replication.Automatic"
        optional :user_managed, :message, 2, "google.cloud.secretmanager.v1.Replication.UserManaged"
      end
    end
    add_message "google.cloud.secretmanager.v1.Replication.Automatic" do
      optional :customer_managed_encryption, :message, 1, "google.cloud.secretmanager.v1.CustomerManagedEncryption"
    end
    add_message "google.cloud.secretmanager.v1.Replication.UserManaged" do
      repeated :replicas, :message, 1, "google.cloud.secretmanager.v1.Replication.UserManaged.Replica"
    end
    add_message "google.cloud.secretmanager.v1.Replication.UserManaged.Replica" do
      optional :location, :string, 1
      optional :customer_managed_encryption, :message, 2, "google.cloud.secretmanager.v1.CustomerManagedEncryption"
    end
    add_message "google.cloud.secretmanager.v1.CustomerManagedEncryption" do
      optional :kms_key_name, :string, 1
    end
    add_message "google.cloud.secretmanager.v1.ReplicationStatus" do
      oneof :replication_status do
        optional :automatic, :message, 1, "google.cloud.secretmanager.v1.ReplicationStatus.AutomaticStatus"
        optional :user_managed, :message, 2, "google.cloud.secretmanager.v1.ReplicationStatus.UserManagedStatus"
      end
    end
    add_message "google.cloud.secretmanager.v1.ReplicationStatus.AutomaticStatus" do
      optional :customer_managed_encryption, :message, 1, "google.cloud.secretmanager.v1.CustomerManagedEncryptionStatus"
    end
    add_message "google.cloud.secretmanager.v1.ReplicationStatus.UserManagedStatus" do
      repeated :replicas, :message, 1, "google.cloud.secretmanager.v1.ReplicationStatus.UserManagedStatus.ReplicaStatus"
    end
    add_message "google.cloud.secretmanager.v1.ReplicationStatus.UserManagedStatus.ReplicaStatus" do
      optional :location, :string, 1
      optional :customer_managed_encryption, :message, 2, "google.cloud.secretmanager.v1.CustomerManagedEncryptionStatus"
    end
    add_message "google.cloud.secretmanager.v1.CustomerManagedEncryptionStatus" do
      optional :kms_key_version_name, :string, 1
    end
    add_message "google.cloud.secretmanager.v1.SecretPayload" do
      optional :data, :bytes, 1
    end
  end
end

module Google
  module Cloud
    module SecretManager
      module V1
        Secret = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.Secret").msgclass
        SecretVersion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.SecretVersion").msgclass
        SecretVersion::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.SecretVersion.State").enummodule
        Replication = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.Replication").msgclass
        Replication::Automatic = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.Replication.Automatic").msgclass
        Replication::UserManaged = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.Replication.UserManaged").msgclass
        Replication::UserManaged::Replica = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.Replication.UserManaged.Replica").msgclass
        CustomerManagedEncryption = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.CustomerManagedEncryption").msgclass
        ReplicationStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.ReplicationStatus").msgclass
        ReplicationStatus::AutomaticStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.ReplicationStatus.AutomaticStatus").msgclass
        ReplicationStatus::UserManagedStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.ReplicationStatus.UserManagedStatus").msgclass
        ReplicationStatus::UserManagedStatus::ReplicaStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.ReplicationStatus.UserManagedStatus.ReplicaStatus").msgclass
        CustomerManagedEncryptionStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.CustomerManagedEncryptionStatus").msgclass
        SecretPayload = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.secretmanager.v1.SecretPayload").msgclass
      end
    end
  end
end
