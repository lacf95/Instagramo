# frozen_string_literal: true

Rails.application.config.active_storage.analyzers.append ColorscoreAnalyzer
Rails.application.config.active_storage.analyzers.delete ActiveStorage::Analyzer::ImageAnalyzer
