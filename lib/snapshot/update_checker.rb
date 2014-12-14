require 'open-uri'

module Snapshot
  # Verifies, the user runs the latest version of this gem
  class UpdateChecker
    # This method will check if the latest version is installed and show a warning if that's not the case
    def self.verify_latest_version
      if self.update_available?
        v = fetch_latest
        puts '#######################################################################'.green
        puts "# Snapshot #{v} is available.".green
        puts "# It is recommended to use the latest version.".green
        puts "# Update using '(sudo) gem update snapshot'.".green
        puts "# To see what's new, open https://github.com/KrauseFx/snapshot/releases.".green
        puts '#######################################################################'.green
        return true
      end
      false
    end

    # Is a new official release available (this does not include pre-releases)
    def self.update_available?
      begin
        latest = fetch_latest
        if latest and Gem::Version.new(latest) > Gem::Version.new(current_version)
          return true
        end
      rescue => ex
        Helper.log.debug(ex)
        Helper.log.error("Could not check if 'snapshot' is up to date.")
      end
      return false
    end

    # The currently used version of this gem
    def self.current_version
      Snapshot::VERSION
    end

    private
      def self.fetch_latest
        JSON.parse(open("http://rubygems.org/api/v1/gems/snapshot.json").read)["version"]
      end
  end
end