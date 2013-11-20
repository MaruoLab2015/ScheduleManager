# -*- coding: utf-8 -*-
module ExpPlansHelper

  def createBlank(kaisuu)
    t = Time.now
    strDate = t.strftime("%Y-%m-%d")
    dateAry = strDate.split("-")
    date = Date.new(dateAry[0].to_i, dateAry[1].to_i, dateAry[2].to_i)

    s = "<tr>"
    for i in 0...7
      d = date + i + 7 * kaisuu
      
      s << '<td class="blank">
            <div class="ui-widget-content">
            <ol>'
            
      @array = (sarchMember(d))

      @array.each do |array|
        s << '<li class="schedule">' + array.userName + '</li>'
      end

      if @array[0] == nil

        s <<   '<li class="placeholder">予定なし</li>'
      end
      s << '</ol>
            </div>
            </td>'
    end
    s << "</tr>"
    return s
  end

  def sarchMember (date, roomName)
#    @member = ExpPlan.where(':planDay => date.to_s, :roomName => roomName', date.to_s, roomName)
#    @member = ExpPlan.where('planDay = ? and roomName = ?', date.to_s, roomName.to_s)
    @member = ExpPlan.where('planday = ? and roomname = ?', date.to_s, roomName)
    return @member
  end

  def weekHeader
    t = Time.now
    date = t.strftime("%Y-%m-%d")
    dateAry = date.split("-")
    year = dateAry[0]
    month = dateAry[1]
    day = dateAry[2]

    s = '<tr class="week-header">'
    j = 0
    d = day.to_i

    #曜日
    for i in 0...7
      i = i + t.strftime("%w").to_i
      case i%7
        when 0
          s << '<th class="sun">Sun</th>'
        when 1
          s << "<th>Mon</th>"
        when 2
          s << "<th>Tue</th>"
        when 3
          s << "<th>Wed</th>"
        when 4
          s << "<th>Thu</th>"
        when 5
          s << "<th>Fri</th>"
        when 6
          s << '<th class="sat">Sat</th>'
        

      end
    end
    
    s << "</tr>"
  end
  
  def createDayLabel(kaisuu)
    t = Time.now
    date = t.strftime("%Y-%m-%d")
    dateAry = date.split("-")
    year = dateAry[0]
    month = dateAry[1]
    day = dateAry[2]

    s = '<tr class="dayLabel">'
    j = 0
    d = day.to_i + kaisuu * 7

    #日にち
    while j < 7
      j = j + 1 
      
=begin      if j == 8
        s << "</tr><tr>"
        s << createBlank(0)
      end
=end

      if d  > t.at_end_of_month.day 
        d = d - t.at_end_of_month.day
        nextMonth = month.to_i + 1
        
        if kaisuu == 0
          case d%7
          when 6 #日曜
            s << '<td class="sun lbl"><a href="#" rel="popover">' + nextMonth.to_s + "/" + d.to_s + "</a></td>"       
          when 5 #土曜
            s << '<td class="sat lbl"><a href="#" rel="popover">' + nextMonth.to_s + "/" + d.to_s + "</a></td>"
          else #平日
            s << '<td class="lbl"><a href="#" rel="popover">' + nextMonth.to_s + "/" + d.to_s + "</a></td>"       
          end
          
        else
          case d%7
          when 6 #日曜
            s << '<td class="sun lbl"><a href="#" rel="popover">' + d.to_s + "</a></td>"
          when 5 #土曜
            s << '<td class="sat lbl"><a href="#" rel="popover">' + d.to_s + "</a></td>"
          else #平日
            s << '<td class="lbl"><a href="#" rel="popover">' + d.to_s + "</a></td>"       
          end
        end 
        
      else
      
        case d%7
        when 2 #日曜
          #s << '<td class="sun lbl"><a href="#" rel="popover">' + d.to_s + "</a></td>"
          s << tdATug(d.to_s, 0)
        when 1 #土曜
          #s << '<td class="sat lbl"><a href="#" rel="popover">' + d.to_s + "</a></td>"
          s << tdATug(d.to_s, 1)
        else #平日
          #s << '<td class="lbl"><a href="#" rel="popover">' + d.to_s + "</a></td>"       
          s << tdATug(d.to_s, 2)
        end
      end
      d = d + 1
    end

#     << createBlank(1)

    s << "</tr>"
  end
  def tdATug (str, week)
    case week
      when 0
        return '<td class="sun lbl"><a href="#" class="sun" rel="popover" data-original-title="補足情報" data-content="詳しい情報"> ' + str + "</a></td>"
      when 1
        return '<td class="sat lbl"><a href="#" rel="popover">' + str + "</a></td>"
      else
        return '<td class="lbl"><a href="#" rel="popover">' + str + "</a></td>"
      end
  end




  def changeDate(date, i)
=begin    t = Time.now
    strDate = t.strftime("%Y-%m-%d")
    dateAry = strDate.split("-")
    date1 = Date.new(dateAry[0], dateAry[1], dateAry[2])
=end
    d = date + i
    return d
  end

end
