class ManageIQ::Providers::Lenovo::PhysicalInfraManager < ManageIQ::Providers::PhysicalInfraManager
  has_many :physical_servers, foreign_key: "ems_id", class_name: "ManageIQ::Providers::Lenovo::PhysicalInfraManager::PhysicalServer"

  include ManageIQ::Providers::Lenovo::ManagerMixin
  include_concern 'Operations'

  require_nested :Refresher
  require_nested :RefreshParser
  require_nested :EventCatcher
  require_nested :EventParser
  require_nested :RefreshWorker

  def self.ems_type
    @ems_type ||= "lenovo".freeze
  end

  def self.description
    @description ||= "Lenovo XClarity"
  end
end
