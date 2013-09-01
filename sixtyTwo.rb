@sixtyTwo = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z".split(",")

def intToCode(num)
  median = 0

  numCopy = num
  
  while numCopy != 0
    numCopy = numCopy/62  
    median = median+1
  end

  puts 'median '+median.to_s

  median.times {|num| 
puts 'num '+num.to_s
    tenNum =  (num/62).to_i
    lessNum = num%62.to_i

    if tenNum == 0
      @sixtyTwo[num]
    else
      @sixtyTwo[tenNum].to_s+@sixtyTwo[lessNum].to_s
    end
  }
end

#puts ARGV[0]
puts intToCode(ARGV[0].to_i)


