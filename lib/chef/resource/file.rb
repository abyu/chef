#
# Author:: Adam Jacob (<adam@hjksolutions.com>)
# Copyright:: Copyright (c) 2008 HJK Solutions, LLC
# License:: GNU General Public License version 2 or later
# 
# This program and entire repository is free software; you can
# redistribute it and/or modify it under the terms of the GNU 
# General Public License as published by the Free Software 
# Foundation; either version 2 of the License, or any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
# 


class Chef
  class Resource
    class File < Chef::Resource
        
      def initialize(name, collection=nil)
        @resource_name = :file
        super(name, collection)
        @path = name
        @backup = true
        @action = "create"
        @allowed_actions.push(:create, :delete, :touch)
      end

      def backup(arg=nil)
        set_or_return(
          @backup,
          arg,
          {
            :backup => arg,
          },
          {
            :backup => {
              :kind_of => [ Integer, TrueClass, FalseClass ],
            }
          }
        )
      end
            
      def checksum(arg=nil)
        set_or_return(
          @checksum,
          arg,
          { 
            :checksum => arg,
          },
          {
            :checksum => {
              :regex => /^[a-zA-Z0-9]{32}$/,
            },
          }
        )
      end
          
      def group(arg=nil)
        set_or_return(
          @group,
          arg,
          {
            :group => arg
          },
          {
            :group => {
              :regex => [ /^([a-z]|[A-Z]|[0-9]|_|-)+$/, /^\d+$/ ]
            }
          }
        )
      end
      
      def mode(arg=nil)
        set_or_return(
          @mode,
          arg,
          {
            :mode => arg
          },
          {
            :mode => {
              :regex => /^\d{3,4}$/
            }
          }
        )
      end
      
      def owner(arg=nil)
        set_or_return(
          @owner,
          arg,
          {
            :owner => arg,
          },
          {
            :owner => {
              :regex => [ /^([a-z]|[A-Z]|[0-9]|_|-)+$/, /^\d+$/ ]
            }
          }
        )
      end
      
      def path(arg=nil)
        set_or_return(
          @path,
          arg,
          {
            :path => arg,
          },
          {
            :path => {
              :kind_of => String,
            },
          }
        )
      end
      
    end
  end
end