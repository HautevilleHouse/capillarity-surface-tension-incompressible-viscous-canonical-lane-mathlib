import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.CapillaryGateLemmas

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

def ConstrainedCapillaryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_capillary_endgame (A : AdmissibleClass) :
    ConstrainedCapillaryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse