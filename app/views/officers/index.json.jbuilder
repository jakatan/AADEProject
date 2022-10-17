# frozen_string_literal: true

json.array!(@officers, partial: 'officers/officer', as: :officer)
