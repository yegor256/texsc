# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2020 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'simplecov'

SimpleCov.start do
  root File.expand_path('../..', __dir__)
  command_name "texsc-#{Process.pid}"
  skip 'features/'
  formatters []
end
