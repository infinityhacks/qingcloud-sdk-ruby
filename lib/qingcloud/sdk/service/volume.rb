#  +-------------------------------------------------------------------------
#  | Copyright (C) 2016 Yunify, Inc.
#  +-------------------------------------------------------------------------
#  | Licensed under the Apache License, Version 2.0 (the "License");
#  | you may not use this work except in compliance with the License.
#  | You may obtain a copy of the License in the LICENSE file, or at:
#  |
#  | http://www.apache.org/licenses/LICENSE-2.0
#  |
#  | Unless required by applicable law or agreed to in writing, software
#  | distributed under the License is distributed on an "AS IS" BASIS,
#  | WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  | See the License for the specific language governing permissions and
#  | limitations under the License.
#  +-------------------------------------------------------------------------

require 'active_support/core_ext/hash/keys'

module QingCloud
  module SDK
    class VolumeService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config     = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/volume/attach_volumes.html
      def attach_volumes(instance: '', volumes: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'AttachVolumes',
          request_method: 'GET',
          request_params: {
            'instance' => instance,
            'volumes'  => volumes,
          },
        }

        attach_volumes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def attach_volumes_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['instance'].nil? && !input['request_params']['instance'].to_s.empty?
          raise ParameterRequiredError.new('instance', 'AttachVolumesInput')
        end

        unless !input['request_params']['volumes'].nil? && !input['request_params']['volumes'].to_s.empty?
          raise ParameterRequiredError.new('volumes', 'AttachVolumesInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/volume/create_volumes.html
      def create_volumes(count: nil, size: nil, volume_name: '', volume_type: nil)
        input = {
          config:         config,
          properties:     properties,
          api_name:       'CreateVolumes',
          request_method: 'GET',
          request_params: {
            'count'       => count,
            'size'        => size,
            'volume_name' => volume_name,
            'volume_type' => volume_type, # volume_type's available values: 0, 1, 2, 3
          },
        }

        create_volumes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def create_volumes_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['size'].nil? && !input['request_params']['size'].to_s.empty?
          raise ParameterRequiredError.new('size', 'CreateVolumesInput')
        end

        if input['request_params']['volume_type'] && !input['request_params']['volume_type'].to_s.empty?
          volume_type_valid_values = %w(0 1 2 3)
          unless volume_type_valid_values.include? input['request_params']['volume_type'].to_s
            raise ParameterValueNotAllowedError.new(
              'volume_type',
              input['request_params']['volume_type'],
              volume_type_valid_values,
            )
          end
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/volume/delete_volumes.html
      def delete_volumes(volumes: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'DeleteVolumes',
          request_method: 'GET',
          request_params: {
            'volumes' => volumes,
          },
        }

        delete_volumes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def delete_volumes_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['volumes'].nil? && !input['request_params']['volumes'].to_s.empty?
          raise ParameterRequiredError.new('volumes', 'DeleteVolumesInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/volume/describe_volumes.html
      def describe_volumes(limit: nil, offset: nil, search_word: '', status: [], tags: [], verbose: nil, volume_type: nil, volumes: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'DescribeVolumes',
          request_method: 'GET',
          request_params: {
            'limit'       => limit,
            'offset'      => offset,
            'search_word' => search_word,
            'status'      => status,
            'tags'        => tags,
            'verbose'     => verbose, # verbose's available values: 0, 1
            'volume_type' => volume_type, # volume_type's available values: 0, 1, 2, 3
            'volumes'     => volumes,
          },
        }

        describe_volumes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def describe_volumes_input_validate(input)
        input.deep_stringify_keys!

        if input['request_params']['verbose'] && !input['request_params']['verbose'].to_s.empty?
          verbose_valid_values = %w(0 1)
          unless verbose_valid_values.include? input['request_params']['verbose'].to_s
            raise ParameterValueNotAllowedError.new(
              'verbose',
              input['request_params']['verbose'],
              verbose_valid_values,
            )
          end
        end

        if input['request_params']['volume_type'] && !input['request_params']['volume_type'].to_s.empty?
          volume_type_valid_values = %w(0 1 2 3)
          unless volume_type_valid_values.include? input['request_params']['volume_type'].to_s
            raise ParameterValueNotAllowedError.new(
              'volume_type',
              input['request_params']['volume_type'],
              volume_type_valid_values,
            )
          end
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/volume/detach_volumes.html
      def detach_volumes(instance: '', volumes: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'DetachVolumes',
          request_method: 'GET',
          request_params: {
            'instance' => instance,
            'volumes'  => volumes,
          },
        }

        detach_volumes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def detach_volumes_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['instance'].nil? && !input['request_params']['instance'].to_s.empty?
          raise ParameterRequiredError.new('instance', 'DetachVolumesInput')
        end

        unless !input['request_params']['volumes'].nil? && !input['request_params']['volumes'].to_s.empty?
          raise ParameterRequiredError.new('volumes', 'DetachVolumesInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/volume/modify_volume_attributes.html
      def modify_volume_attributes(description: '', volume: '', volume_name: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'ModifyVolumeAttributes',
          request_method: 'GET',
          request_params: {
            'description' => description,
            'volume'      => volume,
            'volume_name' => volume_name,
          },
        }

        modify_volume_attributes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def modify_volume_attributes_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['volume'].nil? && !input['request_params']['volume'].to_s.empty?
          raise ParameterRequiredError.new('volume', 'ModifyVolumeAttributesInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/volume/resize_volumes.html
      def resize_volumes(size: nil, volumes: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'ResizeVolumes',
          request_method: 'GET',
          request_params: {
            'size'    => size,
            'volumes' => volumes,
          },
        }

        resize_volumes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def resize_volumes_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['size'].nil? && !input['request_params']['size'].to_s.empty?
          raise ParameterRequiredError.new('size', 'ResizeVolumesInput')
        end

        unless !input['request_params']['volumes'].nil? && !input['request_params']['volumes'].to_s.empty?
          raise ParameterRequiredError.new('volumes', 'ResizeVolumesInput')
        end
      end

      public
    end
  end
end
