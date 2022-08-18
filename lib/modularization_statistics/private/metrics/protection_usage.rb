# typed: strict
# frozen_string_literal: true

module ModularizationStatistics
  module Private
    module Metrics
      class ProtectionUsage
        extend T::Sig

        sig { params(prefix: String, protected_packages: T::Array[PackageProtections::ProtectedPackage], package_tags: T::Array[Tag]).returns(T::Array[GaugeMetric]) }
        def self.get_protections_metrics(prefix, protected_packages, package_tags)
          PackageProtections.all.flat_map do |protection|
            PackageProtections::ViolationBehavior.each_value.map do |violation_behavior|
              # https://github.com/Gusto/package_protections/pull/42 changed the public API of these violation behaviors.
              # To preserve our ability to understand historical trends, we map to the old values.
              # This allows our dashboards to continue to operate as expected.
              # Note if we ever open source mod stats, we should probably inject this behavior so that new clients can see the new keys in their metrics.
              violation_behavior_map = {
                PackageProtections::ViolationBehavior::FailOnAny => 'fail_the_build_on_any_instances',
                PackageProtections::ViolationBehavior::FailNever => 'no',
                PackageProtections::ViolationBehavior::FailOnNew => 'fail_the_build_if_new_instances_appear',
              }
              violation_behavior_name = violation_behavior_map[violation_behavior]
              metric_name = "#{prefix}.#{protection.identifier}.#{violation_behavior_name}.count"
              count_of_packages = protected_packages.count { |p| p.violation_behavior_for(protection.identifier) == violation_behavior }
              GaugeMetric.for(metric_name, count_of_packages, package_tags)
            end
          end
        end
      end
    end
  end
end