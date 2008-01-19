# Copyright 2007, Diego "Flameeyes" Pettenò <flameeyes@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this generator; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

require 'test/unit'
require 'pathname'
require 'elf'

class TC_Exceptions < Test::Unit::TestCase
  TestDir = Pathname.new(__FILE__).dirname + "binaries"

  def test_notanelf
    assert(File.exist?(TestDir + "invalid_nonelf"),
           "Missing test file invalid_nonelf")

    exception_received = false
    begin
      elf = Elf::File.new(TestDir + "invalid_nonelf")
      elf.close
    rescue Elf::File::NotAnELF
      exception_received = true
    end

    assert(exception_received, "Elf::File::NotAnElf exception not received")
  end

  def test_invalid_elfclass
    assert(File.exist?(TestDir + "invalid_invalidclass"),
           "Missing test file invalid_invalidclass")

    exception_received = false
    begin
      elf = Elf::File.new(TestDir + "invalid_invalidclass")
      elf.close
    rescue Elf::File::InvalidElfClass
      exception_received = true
    end

    assert(exception_received, "Elf::File::InvalidElfClass exception not received.")
  end

  def test_invalid_encoding
    assert(File.exist?(TestDir + "invalid_invalidencoding"),
           "Missing test file invalid_invalidencoding")

    exception_received = false
    begin
      elf = Elf::File.new(TestDir + "invalid_invalidencoding")
      elf.close
    rescue Elf::File::InvalidDataEncoding
      exception_received = true
    end

    assert(exception_received, "Elf::File::InvalidDataEncoding exception not received.")
  end

  def test_unsupported_version
    assert(File.exist?(TestDir + "invalid_unsupportedversion"),
           "Missing test file invalid_unsupportedversion")

    exception_received = false
    begin
      elf = Elf::File.new(TestDir + "invalid_unsupportedversion")
      elf.close
    rescue Elf::File::UnsupportedElfVersion
      exception_received = true
    end

    assert(exception_received, "Elf::File::UnsupportedElfVersion exception not received.")
  end

  def test_invalid_abi
    assert(File.exist?(TestDir + "invalid_invalidabi"),
           "Missing test file invalid_invalidabi")

    exception_received = false
    begin
      elf = Elf::File.new(TestDir + "invalid_invalidabi")
      elf.close
    rescue Elf::File::InvalidOsAbi
      exception_received = true
    end

    assert(exception_received, "Elf::File::InvalidOsAbi exception not received.")
  end

  def test_invalid_type
    assert(File.exist?(TestDir + "invalid_invalidtype"),
           "Missing test file invalid_invalidtype")

    exception_received = false
    begin
      elf = Elf::File.new(TestDir + "invalid_invalidtype")
      elf.close
    rescue Elf::File::InvalidElfType
      exception_received = true
    end

    assert(exception_received, "Elf::File::InvalidElfType exception not received.")
  end

  def test_invalid_machine
    assert(File.exist?(TestDir + "invalid_invalidmachine"),
           "Missing test file invalid_invalidmachine")

    exception_received = false
    begin
      elf = Elf::File.new(TestDir + "invalid_invalidmachine")
      elf.close
    rescue Elf::File::InvalidMachine
      exception_received = true
    end

    assert(exception_received, "Elf::File::InvalidMachine exception not received.")
  end
end