# Copyright 2017 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'api/object'
require 'provider/overrides/resources'
require 'provider/terraform/property_override'

module Provider
  module Overrides
    module Terraform
      # Terraform-specific overrides to api.yaml.
      class PropertyOverride < Provider::Overrides::PropertyOverride
        include Provider::Terraform::PropertyOverrideSharedCode
        # Collection of fields allowed in the PropertyOverride section for
        # Terraform. All fields should be `attr_reader :<property>`
        def self.attributes
          Provider::Terraform::OverrideFields.attributes
        end

        attr_reader(*attributes)

        # Used to allow us to easily access these values in `apply`
        # without resorting to "instance_variable_get"
        attr_reader :description
      end
    end
  end
end
