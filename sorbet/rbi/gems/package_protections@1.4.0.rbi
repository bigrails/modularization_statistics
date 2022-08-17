# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `package_protections` gem.
# Please instead update this file by running `bin/tapioca gem package_protections`.

module PackageProtections
  class << self
    sig { returns(T::Array[::PackageProtections::ProtectionInterface]) }
    def all; end

    sig { void }
    def bust_cache!; end

    sig { params(blk: T.proc.params(arg0: ::PackageProtections::Private::Configuration).void).void }
    def configure(&blk); end

    sig do
      params(
        packages: T::Array[::ParsePackwerk::Package],
        new_violations: T::Array[::PackageProtections::PerFileViolation]
      ).returns(T::Array[::PackageProtections::Offense])
    end
    def get_offenses(packages:, new_violations:); end

    sig { params(identifier: ::String).returns(T::Hash[T.untyped, T.untyped]) }
    def private_cop_config(identifier); end

    sig { params(root_pathname: ::Pathname).returns(::String) }
    def rubocop_yml(root_pathname: T.unsafe(nil)); end

    sig do
      params(
        packages: T::Array[::ParsePackwerk::Package],
        protection_identifiers: T::Array[::String],
        verbose: T::Boolean
      ).void
    end
    def set_defaults!(packages, protection_identifiers: T.unsafe(nil), verbose: T.unsafe(nil)); end

    sig { params(identifier: ::String).returns(::PackageProtections::ProtectionInterface) }
    def with_identifier(identifier); end
  end
end

PackageProtections::EXPECTED_PACK_DIRECTORIES = T.let(T.unsafe(nil), Array)
PackageProtections::Identifier = T.type_alias { ::String }
class PackageProtections::IncorrectPublicApiUsageError < ::StandardError; end

class PackageProtections::Offense < ::T::Struct
  const :file, ::String
  const :message, ::String
  const :package, ::ParsePackwerk::Package
  const :violation_type, ::String

  sig { returns(::String) }
  def package_name; end

  class << self
    def inherited(s); end
  end
end

PackageProtections::PROTECTIONS_TODO_YML = T.let(T.unsafe(nil), String)

class PackageProtections::PerFileViolation < ::T::Struct
  const :class_name, ::String
  const :constant_source_package, ::String
  const :filepath, ::String
  const :reference_source_package, ::ParsePackwerk::Package
  const :type, ::String

  sig { returns(T::Boolean) }
  def dependency?; end

  sig { returns(T::Boolean) }
  def privacy?; end

  class << self
    sig do
      params(
        violation: ::ParsePackwerk::Violation,
        reference_source_package: ::ParsePackwerk::Package
      ).returns(T::Array[::PackageProtections::PerFileViolation])
    end
    def from(violation, reference_source_package); end

    def inherited(s); end
  end
end

module PackageProtections::Private
  class << self
    sig { returns(T::Array[::PackageProtections::ProtectedPackage]) }
    def all_protected_packages; end

    sig { void }
    def bust_cache!; end

    sig { returns(::PackageProtections::Private::Configuration) }
    def config; end

    sig do
      params(
        packages: T::Array[::ParsePackwerk::Package],
        new_violations: T::Array[::PackageProtections::PerFileViolation]
      ).returns(T::Array[::PackageProtections::Offense])
    end
    def get_offenses(packages:, new_violations:); end

    sig { params(name: ::String).returns(::PackageProtections::ProtectedPackage) }
    def get_package_with_name(name); end

    sig { params(identifier: ::String).returns(T::Hash[T.untyped, T.untyped]) }
    def private_cop_config(identifier); end

    sig { params(root_pathname: ::Pathname).returns(::String) }
    def rubocop_yml(root_pathname:); end

    sig do
      params(
        packages: T::Array[::ParsePackwerk::Package],
        protection_identifiers: T::Array[::String],
        verbose: T::Boolean
      ).void
    end
    def set_defaults!(packages, protection_identifiers:, verbose:); end
  end
end

class PackageProtections::Private::ColorizedString
  sig { params(original_string: ::String, color: ::PackageProtections::Private::ColorizedString::Color).void }
  def initialize(original_string, color = T.unsafe(nil)); end

  sig { returns(::PackageProtections::Private::ColorizedString) }
  def blue; end

  sig { returns(::String) }
  def colorized_to_s; end

  sig { returns(::PackageProtections::Private::ColorizedString) }
  def green; end

  sig { returns(::PackageProtections::Private::ColorizedString) }
  def light_blue; end

  sig { returns(::PackageProtections::Private::ColorizedString) }
  def pink; end

  sig { returns(::PackageProtections::Private::ColorizedString) }
  def red; end

  sig { returns(::String) }
  def to_s; end

  sig { returns(::PackageProtections::Private::ColorizedString) }
  def white; end

  sig { returns(::PackageProtections::Private::ColorizedString) }
  def yellow; end

  private

  sig { returns(::Integer) }
  def color_code; end

  sig do
    params(
      color: ::PackageProtections::Private::ColorizedString::Color
    ).returns(::PackageProtections::Private::ColorizedString)
  end
  def colorize(color); end
end

class PackageProtections::Private::ColorizedString::Color < ::T::Enum
  enums do
    Black = new
    Red = new
    Green = new
    Yellow = new
    Blue = new
    Pink = new
    LightBlue = new
    White = new
  end
end

class PackageProtections::Private::Configuration
  sig { void }
  def initialize; end

  sig { void }
  def bust_cache!; end

  sig { returns(T::Array[::PackageProtections::ProtectionInterface]) }
  def default_protections; end

  sig { returns(T::Array[::PackageProtections::ProtectionInterface]) }
  def protections; end

  sig { params(protections: T::Array[::PackageProtections::ProtectionInterface]).void }
  def protections=(protections); end
end

class PackageProtections::Private::IncomingPrivacyProtection
  include ::PackageProtections::ProtectionInterface

  sig do
    override
      .params(
        protected_packages: T::Array[::PackageProtections::ProtectedPackage]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_existing_violations(protected_packages); end

  sig do
    override
      .params(
        new_violations: T::Array[::PackageProtections::PerFileViolation]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_new_violations(new_violations); end

  sig { override.returns(::String) }
  def humanized_protection_description; end

  sig { override.returns(::String) }
  def humanized_protection_name; end

  sig { override.returns(::String) }
  def identifier; end

  sig do
    override
      .params(
        behavior: ::PackageProtections::ViolationBehavior,
        package: ::ParsePackwerk::Package
      ).returns(T.nilable(::String))
  end
  def unmet_preconditions_for_behavior(behavior, package); end

  private

  sig { params(per_file_violation: ::PackageProtections::PerFileViolation).returns(::String) }
  def message_for_fail_on_any(per_file_violation); end

  sig { params(per_file_violation: ::PackageProtections::PerFileViolation).returns(::String) }
  def message_for_fail_on_new(per_file_violation); end
end

PackageProtections::Private::IncomingPrivacyProtection::IDENTIFIER = T.let(T.unsafe(nil), String)

class PackageProtections::Private::MetadataModifiers
  class << self
    sig do
      params(
        package: ::ParsePackwerk::Package,
        protection_identifier: ::String,
        violation_behavior: ::PackageProtections::ViolationBehavior
      ).returns(::ParsePackwerk::Package)
    end
    def package_with_modified_protection(package, protection_identifier, violation_behavior); end
  end
end

class PackageProtections::Private::OutgoingDependencyProtection
  include ::PackageProtections::ProtectionInterface

  sig do
    override
      .params(
        protected_packages: T::Array[::PackageProtections::ProtectedPackage]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_existing_violations(protected_packages); end

  sig do
    override
      .params(
        new_violations: T::Array[::PackageProtections::PerFileViolation]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_new_violations(new_violations); end

  sig { override.returns(::String) }
  def humanized_protection_description; end

  sig { override.returns(::String) }
  def humanized_protection_name; end

  sig { override.returns(::String) }
  def identifier; end

  sig do
    override
      .params(
        behavior: ::PackageProtections::ViolationBehavior,
        package: ::ParsePackwerk::Package
      ).returns(T.nilable(::String))
  end
  def unmet_preconditions_for_behavior(behavior, package); end

  private

  sig { params(per_file_violation: ::PackageProtections::PerFileViolation).returns(::String) }
  def message_for_fail_on_any(per_file_violation); end

  sig { params(per_file_violation: ::PackageProtections::PerFileViolation).returns(::String) }
  def message_for_fail_on_new(per_file_violation); end
end

PackageProtections::Private::OutgoingDependencyProtection::IDENTIFIER = T.let(T.unsafe(nil), String)

class PackageProtections::Private::Output
  class << self
    sig { params(str: ::String).void }
    def p(str); end

    sig { params(str: ::PackageProtections::Private::ColorizedString, colorized: T::Boolean).void }
    def p_colorized(str, colorized:); end
  end
end

class PackageProtections::Private::VisibilityProtection
  include ::PackageProtections::ProtectionInterface

  sig { returns(::PackageProtections::ViolationBehavior) }
  def default_behavior; end

  sig do
    override
      .params(
        protected_packages: T::Array[::PackageProtections::ProtectedPackage]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_existing_violations(protected_packages); end

  sig do
    override
      .params(
        new_violations: T::Array[::PackageProtections::PerFileViolation]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_new_violations(new_violations); end

  sig { override.returns(::String) }
  def humanized_protection_description; end

  sig { override.returns(::String) }
  def humanized_protection_name; end

  sig { override.returns(::String) }
  def identifier; end

  sig do
    override
      .params(
        behavior: ::PackageProtections::ViolationBehavior,
        package: ::ParsePackwerk::Package
      ).returns(T.nilable(::String))
  end
  def unmet_preconditions_for_behavior(behavior, package); end

  private

  sig { params(per_file_violation: ::PackageProtections::PerFileViolation).returns(::String) }
  def message_for_fail_on_any(per_file_violation); end

  sig { params(per_file_violation: ::PackageProtections::PerFileViolation).returns(::String) }
  def message_for_fail_on_new(per_file_violation); end
end

PackageProtections::Private::VisibilityProtection::IDENTIFIER = T.let(T.unsafe(nil), String)

class PackageProtections::ProtectedPackage < ::T::Struct
  const :deprecated_references, ::ParsePackwerk::DeprecatedReferences
  const :original_package, ::ParsePackwerk::Package
  const :protections, T::Hash[::String, ::PackageProtections::ViolationBehavior]

  sig { returns(T::Array[::String]) }
  def dependencies; end

  sig { returns(T::Hash[T.untyped, T.untyped]) }
  def metadata; end

  sig { returns(::String) }
  def name; end

  sig { params(key: ::String).returns(::PackageProtections::ViolationBehavior) }
  def violation_behavior_for(key); end

  sig { returns(T::Array[::ParsePackwerk::Violation]) }
  def violations; end

  sig { returns(T::Set[::String]) }
  def visible_to; end

  sig { returns(::Pathname) }
  def yml; end

  class << self
    sig { params(original_package: ::ParsePackwerk::Package).returns(::PackageProtections::ProtectedPackage) }
    def from(original_package); end

    sig do
      params(
        protection: ::PackageProtections::ProtectionInterface,
        metadata: T::Hash[T.untyped, T.untyped],
        package: ::ParsePackwerk::Package
      ).returns(::PackageProtections::ViolationBehavior)
    end
    def get_violation_behavior(protection, metadata, package); end

    def inherited(s); end
  end
end

module PackageProtections::ProtectionInterface
  requires_ancestor { Kernel }

  abstract!

  sig { returns(::PackageProtections::ViolationBehavior) }
  def default_behavior; end

  sig do
    params(
      protected_packages: T::Array[::PackageProtections::ProtectedPackage],
      new_violations: T::Array[::PackageProtections::PerFileViolation]
    ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses(protected_packages, new_violations); end

  sig do
    abstract
      .params(
        protected_packages: T::Array[::PackageProtections::ProtectedPackage]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_existing_violations(protected_packages); end

  sig do
    abstract
      .params(
        new_violations: T::Array[::PackageProtections::PerFileViolation]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_new_violations(new_violations); end

  sig { abstract.returns(::String) }
  def humanized_protection_description; end

  sig { abstract.returns(::String) }
  def humanized_protection_name; end

  sig { abstract.returns(::String) }
  def identifier; end

  sig do
    params(
      behavior: ::PackageProtections::ViolationBehavior,
      package: ::ParsePackwerk::Package
    ).returns(T::Boolean)
  end
  def supports_violation_behavior?(behavior, package); end

  sig do
    abstract
      .params(
        behavior: ::PackageProtections::ViolationBehavior,
        package: ::ParsePackwerk::Package
      ).returns(T.nilable(::String))
  end
  def unmet_preconditions_for_behavior(behavior, package); end
end

module PackageProtections::RubocopProtectionInterface
  include ::PackageProtections::ProtectionInterface

  abstract!

  sig do
    params(
      packages: T::Array[::PackageProtections::ProtectedPackage]
    ).returns(T::Array[::PackageProtections::RubocopProtectionInterface::CopConfig])
  end
  def cop_configs(packages); end

  sig { abstract.returns(::String) }
  def cop_name; end

  sig { params(package: ::PackageProtections::ProtectedPackage).returns(T::Hash[T.untyped, T.untyped]) }
  def custom_cop_config(package); end

  sig do
    override
      .params(
        protected_packages: T::Array[::PackageProtections::ProtectedPackage]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_existing_violations(protected_packages); end

  sig do
    override
      .params(
        new_violations: T::Array[::PackageProtections::PerFileViolation]
      ).returns(T::Array[::PackageProtections::Offense])
  end
  def get_offenses_for_new_violations(new_violations); end

  sig { abstract.returns(T::Array[::String]) }
  def included_globs_for_pack; end

  sig { abstract.params(file: ::String).returns(::String) }
  def message_for_fail_on_any(file); end

  sig do
    override
      .params(
        behavior: ::PackageProtections::ViolationBehavior,
        package: ::ParsePackwerk::Package
      ).returns(T.nilable(::String))
  end
  def unmet_preconditions_for_behavior(behavior, package); end

  private

  sig { params(rule: ::String).returns(T::Set[::String]) }
  def exclude_for_rule(rule); end

  class << self
    sig { void }
    def bust_rubocop_todo_yml_cache; end

    sig { returns(T.untyped) }
    def rubocop_todo_yml; end
  end
end

class PackageProtections::RubocopProtectionInterface::CopConfig < ::T::Struct
  const :enabled, T::Boolean, default: T.unsafe(nil)
  const :exclude_paths, T::Array[::String], default: T.unsafe(nil)
  const :include_paths, T::Array[::String], default: T.unsafe(nil)
  const :name, ::String

  sig { returns(::String) }
  def to_rubocop_yml_compatible_format; end

  class << self
    def inherited(s); end
  end
end

class PackageProtections::ViolationBehavior < ::T::Enum
  enums do
    FailOnAny = new
    FailOnNew = new
    FailNever = new
  end

  sig { returns(T::Boolean) }
  def enabled?; end

  sig { returns(T::Boolean) }
  def fail_never?; end

  sig { returns(T::Boolean) }
  def fail_on_any?; end

  sig { returns(T::Boolean) }
  def fail_on_new?; end

  class << self
    sig { params(value: T.untyped).returns(::PackageProtections::ViolationBehavior) }
    def from_raw_value(value); end
  end
end

module RuboCop; end
module RuboCop::Cop; end
module RuboCop::Cop::PackageProtections; end
