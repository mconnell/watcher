module DomainsHelper

  # flag any domains that will expire in 30 days
  def render_expired(date)
    out = []

    if date.present? && (date < Time.now + 20.days)
      if date < Time.now + 10.days && date >= Time.now
        out << '<td class="near-renewal">'
      elsif date < Time.now
        if date < Time.now - 30.days
          out << '<td class="suspended">'
        else
          out << '<td class="renewal-required">'
        end
      else
        out << '<td class="almost-near-renewal">'
      end
    else
      out << '<td>'
    end

    out << d(date)
    out << "</td>"
    out.join("\n")
  end

end
